import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class ContactDetailsPage extends StatefulWidget {
  const ContactDetailsPage({super.key});

  @override
  State<ContactDetailsPage> createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
          ),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          child: Column(
            children: [
              sectionCard(userinfoWidget()),
              sectionCard(Column(
                children: cellItems(_powerList),
              )),
              sectionCard(Column(
                children: cellItems(_handleList, center: true),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionCard(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
      margin: EdgeInsets.only(bottom: 15),
      child: child,
    );
  }

  Widget userinfoWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.grey.shade300,
                ),
                borderRadius: BorderRadius.circular(25)),
            margin: const EdgeInsets.only(right: 15),
            height: 50,
            width: 50,
            child: ClipOval(
              child: Image.network('https://picsum.photos/100/100'),
            ),
          ),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nickname',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '账号：admin',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  final List _powerList = [
    {'id': 'query', 'label': '查找聊天记录'},
    {'id': 'remark', 'label': '设置备注'},
    {'id': 'mute', 'label': '消息免打扰'},
    {'id': 'top', 'label': '置顶聊天'},
  ];

  final List _handleList = [
    {'id': 'chat', 'label': '发送消息'},
    {'id': 'delete', 'label': '删除好友'},
  ];

  List<Widget> cellItems(List cellList, {bool? center}) {
    List<Widget> items = [];
    for (int i = 0; i < cellList.length; i++) {
      final item = cellList[i];
      items.add(
        InkWell(
          onTap: () {
            debugPrint('onTap');
            cellItemTap(item);
          },
          child: Container(
            height: 46,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
            decoration: BoxDecoration(
              border: Border(
                bottom: i + 1 == cellList.length
                    ? BorderSide.none
                    : BorderSide(width: 1, color: Colors.grey.shade200),
              ),
            ),
            child: Row(
              mainAxisAlignment: center == true
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  item['label'],
                  style: TextStyle(
                    color: item['id'] == 'delete' ? Colors.red : Colors.black,
                  ),
                ),
                Offstage(
                  offstage: center == true,
                  child: item['id'] == 'mute'
                      ? muteSwitch()
                      : item['id'] == 'top'
                          ? topSwitch()
                          : Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 18,
                              color: Colors.grey.shade400,
                            ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return items;
  }

  cellItemTap(item) {
    debugPrint('cellItemTap, ${item['id']}');
    switch (item['id']) {
      case 'chat':
        context.push('/chat');
        break;
    }
  }

  bool muteFlag = false;
  Widget muteSwitch() {
    return Transform.scale(
      scale: 0.8,
      child: CupertinoSwitch(
        value: muteFlag,
        activeColor: Theme.of(context).primaryColor,
        onChanged: (bool value) {
          setState(() {
            muteFlag = value;
          });
        },
      ),
    );
  }

  bool topFlag = false;
  Widget topSwitch() {
    return Transform.scale(
      scale: 0.8,
      child: CupertinoSwitch(
        value: topFlag,
        activeColor: Theme.of(context).primaryColor,
        onChanged: (bool value) {
          setState(() {
            topFlag = value;
          });
        },
      ),
    );
  }
}
