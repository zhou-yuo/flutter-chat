import 'package:flutter/material.dart';
import '../home/home.dart';
import '../contact/contact.dart';
import '../user/user.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  /// navBar 选中索引
  int _navBarActive = 0;

  /// navbar 列表
  List navBarList = [
    {'id': 'home', 'label': 'Home', 'icon': Icons.home, 'path': '/'},
    {
      'id': 'contact',
      'label': 'Contact',
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

  /// navbar widget items
  List<BottomNavigationBarItem> navBarItems() {
    return navBarList
        .map((item) => BottomNavigationBarItem(
            icon: Icon(item['icon']), label: item['label']))
        .toList();
  }

  /// navbar 点击事件
  void navBarTap(int index, BuildContext context) {
    setState(() {
      _navBarActive = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(navBarList[_navBarActive]['label']),
        actions: const <Widget>[Icon(Icons.search)],
      ),
      body: SafeArea(
        child: IndexedStack(
          //当前页面索引
          index: _navBarActive,
          //定义所有的Tab对应的页面,切换tab时不会再执行对应页面的initState方法
          children: const <Widget>[
            HomePage(),
            ContactPage(),
            UserPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _navBarActive,
        items: navBarItems(),
        onTap: (int index) => navBarTap(index, context),
      ),
    );
  }
}
