import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class RecordViewController {
  void Function() scrollToEnd = () {};
}

class ChatRecordView extends StatefulWidget {
  // 组件 controller
  final RecordViewController controller;
  // 列表传参
  final List<Map<String, Object>> list;

  const ChatRecordView(
      {super.key, required this.controller, required this.list});

  @override
  State<ChatRecordView> createState() => _ChatRecordViewState();
}

class _ChatRecordViewState extends State<ChatRecordView> {
  final now = DateTime.now();
  ScrollController scrollController = ScrollController();

  void _scrollToEnd() {
    // print('scrollToEnd ${DateTime.now().millisecondsSinceEpoch}');
    if (mounted) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }
  }

  List<Widget> _listView() {
    return widget.list.map((item) {
      switch (item['type']) {
        case 'date':
          return DateChip(
            date: DateTime(now.year, now.month, now.day - 2),
            color: Colors.grey.shade300,
          );
        case 'text':
        default:
          return BubbleNormal(
            text: item['text'] as String,
            isSender: item['isSender'] as bool,
            color: item['isSender'] as bool ? Colors.blue : Colors.white,
            textStyle: TextStyle(
              fontSize: 14,
              color: item['isSender'] as bool ? Colors.white : Colors.black87,
            ),
            tail: true,
            sent: item['sent'] as bool,
            // delivered: true,
            seen: item['seen'] as bool,
          );
      }
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    widget.controller.scrollToEnd = _scrollToEnd;

    /// Flutter 监听页面渲染完毕回调
    /// https://blog.csdn.net/lxd_love_lgc/article/details/105724069
    // WidgetsBinding.instance.addPostFrameCallback((mag) {
    //   _scrollToEnd();
    // });
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// 解决复制后渲染问题
  /// 来源： https://stackoverflow.com/questions/51216448/is-there-any-callback-to-tell-me-when-build-function-is-done-in-flutter
  Future<void> _runsAfterBuild() async {
    await Future.delayed(Duration.zero);
    _scrollToEnd();
  }

  @override
  Widget build(BuildContext context) {
    _runsAfterBuild();

    return SingleChildScrollView(
      controller: scrollController,
      // reverse: true,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          BubbleNormal(
            text: 'BubbleNormal 1',
            isSender: true,
            color: Colors.blue,
            textStyle: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
            tail: false,
            sent: true,
            delivered: true,
            seen: false,
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
          Column(
            children: _listView(),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
