import 'package:flutter/material.dart';
import './list_item.dart';
import './list_data.dart';

class ContactPageBody extends StatefulWidget {
  const ContactPageBody({super.key});

  @override
  State<ContactPageBody> createState() => _ContactPageBodyState();
}

class _ContactPageBodyState extends State<ContactPageBody> {
  List _listItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getList();
  }

  void getList() {
    // Dio dio = Dio(BaseOptions(
    //   baseUrl: 'https://www.wanandroid.com/',
    //   connectTimeout: const Duration(seconds: 60),
    // ));
    // Response res = await dio.get('article/list/$_currentPage/json');
    // print('get list res ${res.data}');
    List<Map<String, Object>> _newItems = ListMockData.list(0, 20);
    setState(() {
      _listItems = _newItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _listItems.length,
      itemBuilder: (context, index) {
        return ContactListItem(
          _listItems[index]['nickname'] as String,
          _listItems[index]['avatar'] as String,
        );
      },
    );
  }
}
