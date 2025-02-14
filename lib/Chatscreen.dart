import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/animation.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with SingleTickerProviderStateMixin {
  final List<Map<String, String>> messages = [
    {"text": "How can I assist you today?", "sender": "bot"},
  ];
  final TextEditingController _controller = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _shakeAnimation;
  bool _showSendButton = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _shakeAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 0, end: 10), weight: 1),
      TweenSequenceItem<double>(tween: Tween(begin: 10, end: -10), weight: 1),
      TweenSequenceItem<double>(tween: Tween(begin: -10, end: 0), weight: 1),
    ]).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add({
          "text": _controller.text,
          "sender": "user",
          "time": _formatTime(DateTime.now()),
        });
        _showSendButton = true;
      });

      _animationController.forward().then((_) {
        _animationController.reset();
      });
      Timer(Duration(seconds: 1), () {
        setState(() {
          messages.add({
            "text": "Thank you for your message!",
            "sender": "bot",
            "time": _formatTime(DateTime.now()),
          });
          _showSendButton = false;
          _controller.clear();
        });
      });
    }
  }

  String _formatTime(DateTime time) {
    return "${time.hour}:${time.minute.toString().padLeft(2, '0')} ${time.hour >= 12 ? 'PM' : 'AM'}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.grey[400],
      //   // title: Column(
      //   //   children: [
      //   //     Row(
      //   //       children: [
      //   //         Container(
      //   //           height: 40,
      //   //           width: 40,
      //   //           decoration: BoxDecoration(shape: BoxShape.circle),
      //   //           child: SvgPicture.asset(
      //   //             'assets/logo.svg',
      //   //             width: double.infinity,
      //   //             fit: BoxFit.cover,
      //   //           ),
      //   //         ),
      //   //         Text(
      //   //           "Chat with us",
      //   //           style: TextStyle(
      //   //               fontSize: 15,
      //   //               fontWeight: FontWeight.bold,
      //   //               color: Colors.black87),
      //   //         ),
      //   //       ],
      //   //     ),
      //   //   ],
      //   // ),
      // ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (!isUser)
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.grey[200],
                            child: SvgPicture.asset('assets/logo.svg'),
                          ),
                        SizedBox(width: 8),
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.all(14),
                            margin: EdgeInsets.symmetric(vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                                bottomLeft:
                                    isUser ? Radius.circular(16) : Radius.zero,
                                bottomRight:
                                    isUser ? Radius.zero : Radius.circular(16),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                ),
                              ],
                            ),
                            child: Text(
                              messages[index]["text"]!,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(width: 3),
                        if (isUser)
                          CircleAvatar(
                            radius: 16,
                            backgroundImage:
                                AssetImage('assets/user_profile.png'),
                            backgroundColor: Colors.grey[200],
                          ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: isUser ? 0 : 50,
                          right: isUser ? 50 : 0,
                          top: 4),
                      child: Text(
                        messages[index]["time"] ?? "",
                        style: TextStyle(fontSize: 11, color: Colors.black),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.attach_file, size: 18),
                ),
                SizedBox(
                  width: 1,
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 5, left: 3, top: 3, bottom: 3),
                        child: TextField(
                          controller: _controller,
                          cursorColor: Colors.grey,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          onChanged: (text) {
                            setState(() {
                              _showSendButton = text.isNotEmpty;
                            });
                          },
                          maxLines: null,
                          minLines: 1,
                          decoration: InputDecoration(
                            hintText: "Type a message",
                            hintStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[600],
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Colors.blue.shade900, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Colors.blue.shade900, width: 2),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                          ),
                        ),
                      ),
                      if (_showSendButton && _controller.text.isNotEmpty)
                        Positioned(
                          right: 5,
                          child: AnimatedBuilder(
                            animation: _shakeAnimation,
                            builder: (context, child) {
                              return Transform.translate(
                                offset: Offset(_shakeAnimation.value, 0),
                                child: GestureDetector(
                                  onTap: _sendMessage,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 2),
                                    child: Icon(
                                      Icons.send,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
