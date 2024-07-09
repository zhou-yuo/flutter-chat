import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class ChatRecordView extends StatefulWidget {
  const ChatRecordView({super.key});

  @override
  State<ChatRecordView> createState() => _ChatRecordViewState();
}

class _ChatRecordViewState extends State<ChatRecordView> {
  final now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          BubbleNormal(
            text: 'BubbleNormal 1',
            isSender: true,
            color: Colors.blue,
            tail: false,
            sent: true,
            delivered: true,
            seen: true,
          ),
          BubbleNormal(
            text: 'BubbleNormal 2 tail',
            isSender: true,
            color: Colors.blue,
            tail: true,
            seen: true,
          ),
          BubbleNormal(
            text: 'BubbleNormal 3 tail',
            isSender: false,
            color: Colors.blue,
            tail: true,
            sent: false,
            delivered: true,
          ),
          DateChip(
            date: DateTime(now.year, now.month, now.day - 2),
            color: Colors.grey.shade300,
          ),
          const BubbleSpecialOne(
            text: 'BubbleSpecialOne 1',
            color: Color(0xFF1B97F3),
            textStyle: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          const BubbleSpecialOne(
              text: 'BubbleSpecialOne 2 tail',
              color: Color(0xFF1B97F3),
              textStyle: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
              tail: true,
              sent: true),
          const BubbleSpecialOne(
            text: 'BubbleSpecialOne 3 tail',
            color: Color(0xFF1B97F3),
            textStyle: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
            isSender: false,
            tail: true,
            sent: true,
          ),
          const BubbleSpecialTwo(
            text: 'BubbleSpecialTwo 1',
            isSender: true,
            color: Color(0xFFE8E8EE),
            sent: true,
            tail: false,
          ),
          const BubbleSpecialTwo(
            text: 'BubbleSpecialTwo 2 tail',
            isSender: true,
            color: Color(0xFFE8E8EE),
            sent: true,
            tail: true,
          ),
          const BubbleSpecialTwo(
            text: 'BubbleSpecialTwo 3 tail',
            isSender: false,
            color: Color(0xFFE8E8EE),
            sent: true,
            tail: true,
          ),
          const BubbleSpecialThree(
            text: 'BubbleSpecialThree 1',
            color: Colors.blue,
            textStyle: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
            tail: false,
          ),
          const BubbleSpecialThree(
            text: 'BubbleSpecialThree 2 tail',
            color: Colors.blue,
            textStyle: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
            tail: true,
          ),
          const BubbleSpecialThree(
            text: 'BubbleSpecialThree 3 tail',
            isSender: false,
            color: Colors.white,
            textStyle: TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
            tail: true,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
