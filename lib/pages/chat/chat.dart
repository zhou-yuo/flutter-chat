import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';
import './record_view.dart';
import './record_data.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final RecordViewController _recordViewCtrl = RecordViewController();

  /// input ctrl
  final TextEditingController _inputController = TextEditingController();

  /// input scroll ctrl
  final ScrollController _inputScrollController = ScrollController();

  // 第一次 add
  bool firstAdd = false;
  // 聊天记录
  List<Map<String, Object>> recordList = [];

  static final wsUrl = Uri.parse('wss://echo.websocket.events');
  late final channel;

  void initSocket() async {
    channel = WebSocketChannel.connect(wsUrl);
    await channel.ready;
    print('channel.ready');

    channel.stream.listen((message) {
      print('message - $message');
      recordList.add({
        "id": DateTime.now().millisecondsSinceEpoch,
        'type': 'text',
        "text": message,
        "isSender": false,
        "sent": false,
        "seen": false,
      });
      setState(() {});
      // channel.sink.add('received!');
      // channel.sink.close(status.goingAway);
    });
  }

  @override
  void initState() {
    super.initState();
    initSocket();
  }

  @override
  void dispose() {
    _inputController.dispose();
    _inputScrollController.dispose();
    super.dispose();
  }

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
                Expanded(
                  child: ChatRecordView(
                      controller: _recordViewCtrl, list: recordList),
                ),
                Container(
                  width: double.infinity,
                  // padding:
                  //     const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(12)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: Column(
                          children: [
                            sendCtrl(),
                            mediaCtrl(),
                          ],
                        ),
                      ),
                      emojiPicker(),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  /// 发送模块
  Widget sendCtrl() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.grey[100],
            ),
            child: TextField(
              controller: _inputController,
              scrollController: _inputScrollController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              // textInputAction: TextInputAction.go,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                isCollapsed: true,
              ),
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                height: 1.4,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: handleSend,
          child: Container(
            width: 32,
            height: 32,
            margin: const EdgeInsets.only(left: 12),
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
          ),
        ),
      ],
    );
  }

  //  发送事件
  void handleSend() {
    // 清空 input
    String inputVal = _inputController.text;
    // print('_inputController.text : $inputVal');

    channel.sink.add(inputVal);

    _inputController.clear();
    setState(() {
      if (firstAdd) {
        recordList.add({
          "id": DateTime.now().millisecondsSinceEpoch,
          'type': 'date',
        });
      }
      recordList.add({
        "id": DateTime.now().millisecondsSinceEpoch,
        'type': 'text',
        "text": inputVal,
        "isSender": true,
        "sent": true,
        "seen": false,
      });
    });
    // 关闭 emoji picker
    emojiPickerVisible = false;
    // record scroll 滚动到最底部
    // _recordViewCtrl.scrollToEnd();
  }

  Widget mediaCtrl() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          mediaIcon(Icons.image_outlined),
          InkWell(
            onTap: handleEmoji,
            child: mediaIcon(emojiPickerVisible
                ? Icons.keyboard_alt_outlined
                : Icons.emoji_emotions_outlined),
          ),
          mediaIcon(Icons.location_on_outlined),
          mediaIcon(Icons.folder_outlined),
        ],
      ),
    );
  }

  /// icons
  Widget mediaIcon(IconData icon) {
    return Icon(
      icon,
      size: 24,
      color: Colors.black87,
    );
  }

  bool emojiPickerVisible = false;
  void handleEmoji() {
    setState(() {
      emojiPickerVisible = !emojiPickerVisible;
    });
  }

  /// emoji picker
  Widget emojiPicker() {
    return Offstage(
      offstage: !emojiPickerVisible,
      child: EmojiPicker(
        textEditingController: _inputController,
        scrollController: _inputScrollController,
        config: Config(
          height: 256,
          // Whether to filter out glyphs that platform cannot render with the default font (Android).
          checkPlatformCompatibility: true,
          emojiViewConfig: EmojiViewConfig(
            // Issue: https://github.com/flutter/flutter/issues/28894
            emojiSizeMax: 24 *
                (foundation.defaultTargetPlatform == TargetPlatform.iOS
                    ? 1.2
                    : 1.0),
          ),
          // 	Category view config
          categoryViewConfig: const CategoryViewConfig(
            // The initial Category that will be selected
            initCategory: Category.SMILEYS,
          ),
        ),
      ),
    );
  }
}
