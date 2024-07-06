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
  final int _listTotal = 20;

  @override
  void initState() {
    super.initState();
    getList();
  }

  @override
  void dispose() {
    _refreshCtrl.dispose();
    super.dispose();
  }

  Future getList() async {
    if (!mounted) return;
    await Future.delayed(const Duration(seconds: 1));
    // Dio dio = Dio(BaseOptions(
    //   baseUrl: 'https://www.wanandroid.com/',
    //   connectTimeout: const Duration(seconds: 60),
    // ));
    // Response res = await dio.get('article/list/$_currentPage/json');
    // print('get list res ${res.data}');
    if (!mounted) return;
    List<Map<String, Object>> _newItems =
        await ListMockData.list(_currentPage, 10);
    setState(() {
      if (_currentPage == 0) {
        _listItems = _newItems;
      } else {
        _listItems += _newItems;
      }
    });
  }

  void onReachBottomLoad() async {
    if (_listItems.length >= _listTotal) {
      _refreshCtrl.finishLoad();
      return;
    }
    _currentPage += 1;
    await getList();
  }

  void onPullDownRefresh() async {
    _currentPage = 1;
    getList();
  }

  final EasyRefreshController _refreshCtrl = EasyRefreshController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: EasyRefresh(
        controller: _refreshCtrl,
        header: ClassicHeader(
          dragText: '下拉刷新',
          armedText: '松开后开始刷新',
          readyText: '正在刷新...',
          processingText: '正在刷新...',
          processedText: '刷新完成',
          messageText: '最后刷新时间 %T',
          messageStyle: const TextStyle(color: Colors.black54, fontSize: 12),
          backgroundColor: Colors.grey.shade200,
        ),
        footer: const ClassicFooter(
          dragText: '上拉加载',
          armedText: '松开后开始加载',
          readyText: '正在加载...',
          processingText: '正在加载...',
          processedText: '加载完成',
          messageText: '最后加载时间 %T',
          messageStyle: TextStyle(color: Colors.black54, fontSize: 12),
        ),
        onLoad: () async {
          // onReactBottomLoad
          if (_listItems.length >= _listTotal) {
            return;
          }

          _currentPage += 1;
          await getList();
          print('_listItems.length -> ${_listItems.length}');
          _refreshCtrl.finishLoad(
              _listItems.length >= _listTotal
                  ? IndicatorResult.noMore
                  : IndicatorResult.success,
              true);
        },
        onRefresh: () async {
          // onPullDownRefresh
          _currentPage = 1;
          await getList();
          _refreshCtrl.finishRefresh(IndicatorResult.success, true);
          _refreshCtrl.resetFooter();
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
