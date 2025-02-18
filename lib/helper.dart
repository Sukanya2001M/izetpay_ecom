import 'package:tflite_flutter/tflite_flutter.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class ChatbotService {
  Interpreter? _interpreter;
  late List<String> labels;
  static List<Map<String, dynamic>> intents = [];
  bool _isModelLoaded = false;

  ChatbotService() {
    _initialize().then((_) {
      print("Chatbot is fully initialized.");
    });
  }

  /// Initializes the chatbot by loading the model and dataset
  Future<void> _initialize() async {
    await loadDataset();
    await loadModel();
    await Future.delayed(
        Duration(seconds: 3)); // Delay to ensure everything loads
  }

  /// Loads the dataset from JSON file
  static Future<void> loadDataset() async {
    try {
      String jsonString = await rootBundle.loadString('assets/dataset.json');
      Map<String, dynamic> data = jsonDecode(jsonString);
      intents = List<Map<String, dynamic>>.from(data["intents"]);
      print("Dataset loaded: ${intents.length} intents");
    } catch (e) {
      print("Error loading dataset: $e");
    }
  }

  /// Loads the TFLite model and labels
  Future<void> loadModel() async {
    try {
      _interpreter = await Interpreter.fromAsset('assets/chatbot_model.tflite');
      await loadLabels();
      print("Model loaded successfully");
      _isModelLoaded = true;
    } catch (e) {
      print("Error loading chatbot model: $e");
    }
  }

  /// Loads labels from labels.json
  Future<void> loadLabels() async {
    try {
      final String response = await rootBundle.loadString('assets/labels.json');
      labels = List<String>.from(json.decode(response));
      print("Labels loaded successfully (${labels.length} labels)");
    } catch (e) {
      print("Error loading labels: $e");
    }
  }

  /// Returns the chatbot's initial greeting message
  String getInitialMessage() {
    return "How can I assist you today?";
  }

  /// Finds a response based on the predicted intent tag
  String getFixedResponse(String tag) {
    var matchedIntent = intents.firstWhere(
      (intent) => intent["tag"] == tag,
      orElse: () => {
        "responses": ["I'm not sure how to respond."]
      },
    );

    List responses = matchedIntent["responses"];
    return (responses..shuffle()).first;
  }

  /// Processes user input and returns a chatbot response
  Future<String> getResponse(String userMessage) async {
    if (!_isModelLoaded || _interpreter == null) {
      return "Chatbot is still loading, please wait...";
    }

    // Proceed with processing only if the model is loaded
    try {
      List<double> inputVector = preprocessInput(userMessage);
      print("Input Vector: $inputVector");

      if (inputVector.isEmpty ||
          inputVector.every((element) => element == 0.0)) {
        return "Sorry, I couldn't understand that.";
      }

      var inputTensor = [inputVector];
      var outputTensor =
          List.filled(labels.length, 0.0).reshape([1, labels.length]);

      _interpreter!.run(inputTensor, outputTensor);

      // Debugging output
      print("Tensor data: $outputTensor");

      List<double> scores = outputTensor.first;
      int resultIndex = scores
          .indexOf(scores.reduce((curr, next) => curr > next ? curr : next));

      if (resultIndex < 0 ||
          resultIndex >= labels.length ||
          scores[resultIndex] < 0.5) {
        return "I didn't quite understand that. Can you rephrase?";
      }

      String matchedTag = labels[resultIndex];
      return getFixedResponse(matchedTag);
    } catch (e) {
      print("Error processing chatbot response: $e");
      return "Sorry, I couldn't process that. Please try again.";
    }
  }

  /// Preprocesses user input for the model
  List<double> preprocessInput(String input) {
    if (input.isEmpty) return [];

    // Convert input to lowercase to ensure case-insensitivity
    input = input.toLowerCase();
    List<String> words = input.split(RegExp(r"\s+"));

    // Debugging: print words in input
    print("Words in input: $words");

    List<double> vector = List.filled(labels.length, 0.0);
    Set<String> matchedWords =
        {}; // To avoid matching the same word multiple times

    // Loop through each intent
    for (var intent in intents) {
      List<String> patterns = List<String>.from(intent['patterns']);
      // Loop through each pattern in the intent
      for (var pattern in patterns) {
        // Check for each word in the input
        for (var word in words) {
          // If the word from input matches part of the pattern
          if (pattern.toLowerCase().contains(word) &&
              !matchedWords.contains(word)) {
            int index = labels.indexOf(intent["tag"]);
            if (index != -1) {
              vector[index] = 1.0;
              matchedWords.add(word); // Add word to the matched set
              print(
                  "Match found: '$word' in pattern: '$pattern' (Intent tag: ${intent["tag"]})");
            }
          }
        }
      }
    }

    // Debugging: print preprocessed vector
    print("Preprocessed input vector: $vector");
    return vector;
  }
}
