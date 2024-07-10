import 'package:flutter/material.dart';

class CommonCellItem extends StatefulWidget {
  final Map itemData;
  final bool? border;
  final bool? center;
  final Color? color;
  final Widget? child;
  final Function? onTapCb;
  const CommonCellItem(this.itemData,
      {this.border,
      this.center,
      this.color,
      this.child,
      this.onTapCb,
      super.key});

  @override
  State<CommonCellItem> createState() => _CommonCellItemState();
}

class _CommonCellItemState extends State<CommonCellItem> {
  void cellItemTap() {
    widget.onTapCb!(widget.itemData);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint('onTap');
        cellItemTap();
      },
      child: Container(
        height: 46,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        decoration: BoxDecoration(
          border: Border(
            bottom: widget.border == false
                ? BorderSide.none
                : BorderSide(width: 1, color: Colors.grey.shade200),
          ),
        ),
        child: Row(
          mainAxisAlignment: widget.center == true
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.itemData['label'],
              style: TextStyle(
                color: widget.color ?? Colors.black,
              ),
            ),
            Offstage(
              offstage: widget.center == true,
              child: widget.child ??
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                    color: Colors.grey.shade400,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
