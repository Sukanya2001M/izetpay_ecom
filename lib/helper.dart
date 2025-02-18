import 'package:tflite_flutter/tflite_flutter.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
// import 'package:collection/collection.dart'; // For maxBy function

class ChatbotService {
  late Interpreter _interpreter;
  late List<String> labels;
  static late List<Map<String, dynamic>> intents;
  bool _isModelLoaded = false;

  ChatbotService() {
    loadModel();
  }
  static Future<void> loadDataset() async {
    String jsonString = await rootBundle.loadString('assets/dataset.json');
    Map<String, dynamic> data = jsonDecode(jsonString);

    print(data); // Debugging: Print to check data
  }

  /// Returns the chatbot's initial greeting message.
  String getInitialMessage() {
    return "How can I assist you today?";
  }

  /// Loads the TFLite model and necessary data.
  Future<void> loadModel() async {
    try {
      _interpreter = await Interpreter.fromAsset('assets/chatbot_model.tflite');
      await loadLabels();
      await loadIntents();
      print("Model loaded successfully");
      print("Labels: $labels"); // Debugging print
      _isModelLoaded = true;
    } catch (e) {
      print("Error loading chatbot model: $e");
    }
  }

  /// Loads labels from labels.json.
  Future<void> loadLabels() async {
    try {
      final String response = await rootBundle.loadString('assets/labels.json');
      labels = List<String>.from(json.decode(response));
      print(" Labels loaded successfully (${labels.length} labels)");
    } catch (e) {
      print(" Error loading labels: $e");
    }
  }

  /// Loads intents from intents.json.
  ///
  static Future<List<Map<String, dynamic>>> loadIntents() async {
    try {
      final String response =
          await rootBundle.loadString('assets/dataset.json');
      intents =
          List<Map<String, dynamic>>.from(json.decode(response)["intents"]);
      print("Intents loaded successfully");
      return intents; // ✅ Return the loaded intents
    } catch (e) {
      print("Error loading intents: $e");
      return []; // Return an empty list in case of an error
    }
  }

  /// Finds a response based on the predicted intent tag.
  String getFixedResponse(String tag) {
    var matchedIntent = intents.firstWhere(
      (intent) => intent["tag"] == tag,
      orElse: () => {
        "responses": ["I'm not sure how to respond."]
      },
    );

    // Return a random response from the matched intent
    List responses = matchedIntent["responses"];
    return (responses..shuffle()).first; // Pick a random response
  }

  /// Processes user input and returns a chatbot response.
  Future<String> getResponse(String userMessage) async {
    if (!_isModelLoaded) {
      return "Chatbot is still loading, please try again shortly.";
    }

    if (userMessage.trim().isEmpty) {
      return "Please enter a message.";
    }

    try {
      List<double> inputVector = preprocessInput(userMessage);
      if (inputVector.isEmpty) {
        return "Sorry, I couldn't understand that.";
      }

      var inputTensor = [inputVector];
      var outputTensor =
          List.filled(labels.length, 0.0).reshape([1, labels.length]);

      _interpreter.run(inputTensor, outputTensor);

      // Extract the highest confidence index
      List<double> scores = outputTensor.first;
      int resultIndex = scores
          .indexOf(scores.reduce((curr, next) => curr > next ? curr : next));

      if (resultIndex < 0 || resultIndex >= labels.length) {
        return "I didn't quite understand that. Can you rephrase?";
      }

      String matchedTag = labels[resultIndex];
      return getFixedResponse(matchedTag);
    } catch (e) {
      print(" Error processing chatbot response: $e");
      return "Sorry, I couldn't process that. Please try again.";
    }
  }

  /// Preprocesses user input for the model.
  List<double> preprocessInput(String input) {
    if (input.isEmpty) {
      return [];
    }

    input = input.toLowerCase(); // Convert to lowercase
    List<String> words = input.split(' '); // Split into words

    // Create a vector with the same length as labels, initially filled with zeros
    List<double> vector = List.filled(labels.length, 0.0);

    // Set vector indices to 1 if the word exists in labels
    for (var word in words) {
      int index = labels.indexOf(word);
      if (index != -1) {
        vector[index] = 1.0;
      }
    }

    return vector;
  }
}
