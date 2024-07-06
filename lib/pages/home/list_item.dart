import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListItem extends StatefulWidget {
  const ListItem({super.key});

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: 50,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network('https://picsum.photos/200/200'),
            ),
          ),
        ),
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: Colors.grey.shade300),
              ),
            ),
            child: SizedBox(
              height: 70,
              child: Padding(
                  padding:
                      const EdgeInsets.only(right: 10, top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Nickname',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              'Hello Word',
                              style: TextStyle(
                                  color: Colors.grey.shade400, fontSize: 12),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '01-01',
                            style: TextStyle(
                                color: Colors.grey.shade400, fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
