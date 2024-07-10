import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContactListItem extends StatefulWidget {
  final String nickname;
  final String avatar;
  const ContactListItem(this.nickname, this.avatar, {super.key});

  @override
  State<ContactListItem> createState() => _ContactListItemState();
}

class _ContactListItemState extends State<ContactListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push('/details'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          avatarWidget(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Colors.grey.shade300),
                ),
              ),
              height: 60,
              padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
              child: Row(
                children: [
                  Expanded(child: infoWidget()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 头像
  Widget avatarWidget() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(25)),
      margin: const EdgeInsets.all(10),
      height: 40,
      width: 40,
      child: ClipOval(
        child: Image.network(widget.avatar),
      ),
    );
  }

  /// 主要信息
  Widget infoWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.nickname,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
