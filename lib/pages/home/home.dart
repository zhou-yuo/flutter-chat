import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
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
  final int _listTotal = 45;

  @override
  void initState() {
    super.initState();
    getList();
  }

  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

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
        await HomeListMockData.list(_currentPage, 15);

    setState(() {
      if (_currentPage == 0) {
        _listItems = _newItems;
      } else {
        _listItems += _newItems;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    /// flutter_pulltorefresh SmartRefresher @props
    /// https://github.com/peng8350/flutter_pulltorefresh/blob/master/propertys.md
    return SmartRefresher(
      controller: refreshController,
      enablePullDown: true,
      enablePullUp: true,
      header: const ClassicHeader(),
      footer: const ClassicFooter(),
      onLoading: () async {
        // onReactBottomLoad
        if (!mounted) return;
        if (_listItems.length >= _listTotal) {
          refreshController.loadNoData();
          return;
        }

        _currentPage += 1;
        await getList();

        refreshController.loadComplete();
      },
      onRefresh: () async {
        // onPullDownRefresh
        refreshController.resetNoData();

        setState(() {
          _listItems = [];
          _currentPage = 0;
        });

        await getList();
        refreshController.refreshCompleted();
      },
      child: ListView.builder(
        itemCount: _listItems.length,
        itemBuilder: (context, index) {
          return HomeListItem(
            _listItems[index]['nickname'] as String,
            _listItems[index]['avatar'] as String,
            _listItems[index]['message'] as String,
          );
        },
      ),
    );
  }
}
