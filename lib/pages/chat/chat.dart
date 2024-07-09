import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: SafeArea(
        child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
            ),
            child: Column(
              children: [
                const Expanded(
                  child: Center(
                    child: Text('page view'),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(12))),
                  child: Column(
                    children: [
                      sendCtrl(),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  Widget sendCtrl() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            // textInputAction: TextInputAction.go,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              filled: true,
              fillColor: Colors.grey[100],
            ),

            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ),
        Container(
          width: 32,
          height: 32,
          margin: const EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.blue,
          ),
          child: const Center(
            child: Icon(
              Icons.send,
              color: Colors.white,
              size: 18,
            ),
          ),
        )
      ],
    );
  }
}
