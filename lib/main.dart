import 'package:flutter/material.dart';
import 'package:izetpay_ecom/Chatscreen.dart';
import 'home.dart';
import 'helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final chatbotService = ChatbotService();
  await chatbotService.loadModel();
  runApp(MyApp(chatbotService: chatbotService));
}

class MyApp extends StatelessWidget {
  final ChatbotService chatbotService;

  const MyApp({Key? key, required this.chatbotService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatScreen(chatbotService: chatbotService),
    );
  }
}
