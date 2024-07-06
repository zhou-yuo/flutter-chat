import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatefulWidget {
  final int index;

  // BottomNavBar({Key key, this.currentIndex}) : super.key;
  const BottomNavBar({required this.index, super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  List list = [
    {'id': 'home', 'label': 'Home', 'icon': Icons.home, 'path': '/'},
    {
      'id': 'contact',
      'label': 'User',
      'icon': Icons.people,
      'path': '/contact'
    },
    {
      'od': 'user',
      'label': 'User',
      'icon': Icons.account_circle,
      'path': '/user'
    }
  ];
  List<BottomNavigationBarItem> navBarItems() {
    return list
        .map((item) => BottomNavigationBarItem(
            icon: Icon(item['icon']), label: item['label']))
        .toList();
  }

  @override
  void initState() {
    setState(() {
      currentIndex = widget.index;
    });
  }

  void navBarTap(int index, BuildContext context) {
    setState(() {
      currentIndex = index;
      context.go(list[index]['path']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      items: navBarItems(),
      onTap: (int index) => navBarTap(index, context),
    );
  }
}
