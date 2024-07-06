import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String nickname;
  final String avatar;
  final String message;
  const ListItem(this.nickname, this.avatar, this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
            height: 70,
            padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
            child: Row(
              children: [
                Expanded(child: infoWidget()),
                otherWidget(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// 头像
  Widget avatarWidget() {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 70,
      width: 70,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.network(avatar),
      ),
    );
  }

  /// 主要信息
  Widget infoWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nickname,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          message,
          style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  /// 其他信息（date）
  Widget otherWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '01-01',
          style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
        ),
      ],
    );
  }
}
