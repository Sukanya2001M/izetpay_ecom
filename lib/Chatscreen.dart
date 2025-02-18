import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izetpay_ecom/helper.dart';

class ChatScreen extends StatefulWidget {
  final ChatbotService chatbotService;

  const ChatScreen({Key? key, required this.chatbotService}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with SingleTickerProviderStateMixin {
  late ChatbotService chatbotService;
  final List<Map<String, String>> messages = [];
  final TextEditingController _controller = TextEditingController();
  late Map<String, dynamic> intentsData = {};
  @override
  void initState() {
    super.initState();
    chatbotService = widget.chatbotService;
    _initializeChat();
    ChatbotService.loadIntents().then((data) {
      setState(() {
        intentsData = {"intents": data};
      });
    });
    ChatbotService.loadDataset();
  }

  Future<void> _initializeChat() async {
    String botMessage = chatbotService.getInitialMessage();

    print("Bot initial message: $botMessage"); // Debugging log

    if (botMessage.isNotEmpty) {
      setState(() {
        messages.add({"text": botMessage, "sender": "bot"});
      });
    } else {
      setState(() {
        messages.add(
            {"text": "Hello, how can I assist you today?", "sender": "bot"});
      });
    }

    print("Messages List: $messages"); // Debugging log
  }

  void _sendMessage() async {
    String userMessage = _controller.text.trim();
    if (userMessage.isEmpty) return;

    setState(() {
      messages.add({"text": userMessage, "sender": "user"});
    });

    _controller.clear();

    String botResponse = await chatbotService.getResponse(userMessage);
    setState(() {
      messages.add({"text": botResponse, "sender": "bot"});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(13),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                bool isUser = messages[index]["sender"] == "user";
                return Column(
                  crossAxisAlignment: isUser
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: isUser
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        if (!isUser)
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.grey[200],
                            child: SvgPicture.asset(
                              'assets/logo.svg',
                              placeholderBuilder: (BuildContext context) =>
                                  Icon(Icons.person, size: 16),
                            ),
                          ),
                        SizedBox(width: 8),
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.all(14),
                            margin: EdgeInsets.symmetric(vertical: 4),
                            decoration: BoxDecoration(
                              color:
                                  isUser ? Colors.blue[100] : Colors.grey[300],
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [BoxShadow(color: Colors.black12)],
                            ),
                            child: Text(
                              messages[index]["text"]!,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Ask a question...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.blue),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
