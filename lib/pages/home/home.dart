import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
// import './list_data.dart';
import './list_item.dart';
import './friend_json_modal/friend_json_modal.dart';
import './friend_json_modal/datum.dart';
import '../../utils/request.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Datum> _listItems = [];
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

    Response res = await Request.send('GET', 'friend/json');
    FriendJsonModal resData = FriendJsonModal.fromJson(res.data);
    List<Datum> newItems = resData.data ?? [];

    setState(() {
      if (_currentPage == 0) {
        _listItems = newItems;
      } else {
        _listItems += newItems;
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
            _listItems[index].name as String,
            // _listItems[index]['avatar'] as String,
            'https://picsum.photos/100/100',
            _listItems[index].link as String,
          );
        },
      ),
    );
  }
}
