import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      child: Column(
        children: [
          userinfoWidget(),
          cellsWidget(),
        ],
      ),
    );
  }

  Widget userinfoWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.circular(25)),
          // margin: const EdgeInsets.all(10),
          height: 50,
          width: 50,
          child: ClipOval(
            child: Image.network(
                'https://picsum.photos/100/100?t=${DateTime.now().microsecondsSinceEpoch}'),
          ),
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nickname',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'ID: 123456',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  final List _cellList = [
    {'label': '账号管理'},
    {'label': '退出登录'},
  ];

  List<Widget> _cellItems() {
    List<Widget> items = [];
    for (int i = 0; i < _cellList.length; i++) {
      items.add(Container(
        height: 50,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: i + 1 == _cellList.length
                ? BorderSide.none
                : BorderSide(width: 1, color: Colors.grey.shade200),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text(_cellList[i]['label'])],
        ),
      ));
    }
    return items;
  }

  Widget cellsWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: _cellItems(),
      ),
    );
  }
}
