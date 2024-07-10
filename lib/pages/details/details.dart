import 'package:flutter/material.dart';

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
                children: cellItems(),
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

  final List _cellList = [
    {'id': 'query', 'label': '查找聊天记录'},
    {'id': 'remark', 'label': '设置备注'},
    {'id': 'mute', 'label': '消息免打扰'},
    {'id': 'top', 'label': '置顶聊天'},
  ];

  List<Widget> cellItems() {
    List<Widget> items = [];
    for (int i = 0; i < _cellList.length; i++) {
      items.add(Container(
        height: 46,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        decoration: BoxDecoration(
          border: Border(
            bottom: i + 1 == _cellList.length
                ? BorderSide.none
                : BorderSide(width: 1, color: Colors.grey.shade200),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(_cellList[i]['label']),
            _cellList[i]['id'] == 'mute'
                ? muteSwitch()
                : _cellList[i]['id'] == 'top'
                    ? topSwitch()
                    : Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Colors.grey.shade400,
                      ),
          ],
        ),
      ));
    }
    return items;
  }

  bool muteFlag = false;
  Widget muteSwitch() {
    return Switch(
      value: muteFlag,
      onChanged: (bool value) {
        setState(() {
          muteFlag = value;
        });
      },
    );
  }

  bool topFlag = false;
  Widget topSwitch() {
    return Switch(
      value: topFlag,
      onChanged: (bool value) {
        setState(() {
          topFlag = value;
        });
      },
    );
  }
}
