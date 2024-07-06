import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:easy_refresh/easy_refresh.dart';
import '../../components/bottom_nav_bar.dart';
import './list_data.dart';
import './list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, Object>> _listItems = [];
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    getList();
  }

  void getList() async {
    // Dio dio = Dio(BaseOptions(
    //   baseUrl: 'https://www.wanandroid.com/',
    //   connectTimeout: const Duration(seconds: 60),
    // ));
    // Response res = await dio.get('article/list/$_currentPage/json');
    // print('get list res ${res.data}');
    List<Map<String, Object>> _newItems =
        await ListMockData.list(_currentPage, 15);
    setState(() {
      if (_currentPage == 0) {
        _listItems = _newItems;
      } else {
        _listItems += _newItems;
      }
    });
  }

  void onLoad() {
    _currentPage += 1;
    getList();
  }

  void onRefresh() {
    _currentPage = 1;
    getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: EasyRefresh(
        onLoad: () async {
          print('load...');
          onLoad();
        },
        onRefresh: () async {
          onRefresh();
        },
        child: ListView.builder(
          itemCount: _listItems.length,
          itemBuilder: (context, index) {
            return ListItem(
              _listItems[index]['nickname'] as String,
              _listItems[index]['avatar'] as String,
              _listItems[index]['message'] as String,
            );
          },
        ),
      ),
      bottomNavigationBar: const BottomNavBar(index: 0),
    );
  }
}
