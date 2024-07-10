import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../components/cell_item/cell_item.dart';

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
          cellsWidget(_powerList),
          cellsWidget(_handleList),
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
            child: Image.network('https://picsum.photos/100/100'),
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

  final List _powerList = [
    {'id': 'accounnt', 'label': '账号管理'},
    {'id': 'update', 'label': '检查更新'},
    {'id': 'about', 'label': '关于我们', 'border': false},
  ];

  final List _handleList = [
    {
      'id': 'logout',
      'label': '退出登录',
      'center': true,
      'border': false,
      'color': Colors.red
    },
  ];

  List<Widget> _cellItems(List cellList) {
    List<Widget> items = [];
    for (int i = 0; i < cellList.length; i++) {
      final itemData = cellList[i];
      items.add(CommonCellItem(
        itemData,
        center: itemData['center'] ?? false,
        border: itemData['border'] ?? true,
        color: itemData['color'],
        onTapCb: cellItemTap,
      ));
    }
    return items;
  }

  Widget cellsWidget(List list) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: _cellItems(list),
      ),
    );
  }

  cellItemTap(item) {
    debugPrint('cellItemTap, ${item['id']}');
    EasyLoading.showToast("${item['label']}");
  }
}
