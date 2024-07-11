import 'package:flutter/material.dart';

enum LoginButtonType {
  primary,
  outline,
  text,
}

class LoginBtn extends StatefulWidget {
  final String text;
  final Color? primaryColor;
  final LoginButtonType? type;
  final Function? handleTap;
  const LoginBtn(this.text,
      {this.primaryColor,
      this.type = LoginButtonType.primary,
      this.handleTap,
      super.key});

  @override
  State<LoginBtn> createState() => _LoginBtnState();
}

class _LoginBtnState extends State<LoginBtn> {
  late final dynamic bgColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    switch (widget.type) {
      case LoginButtonType.outline:
        bgColor = Colors.white;
        break;
      case LoginButtonType.text:
        bgColor = Colors.transparent;
        break;
      default:
        bgColor = widget.primaryColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    final themePrimaryColor = Theme.of(context).primaryColor;
    final usedPrimaryColor = widget.primaryColor ?? themePrimaryColor;

    return InkWell(
      onTap: () {
        if (widget.handleTap is Function) {
          widget.handleTap!();
        }
      },
      child: Container(
        height: 32,
        decoration: BoxDecoration(
          border: widget.type == LoginButtonType.outline
              ? Border.all(width: 1, color: usedPrimaryColor)
              : null,
          borderRadius: BorderRadius.circular(16),
          color: bgColor ?? usedPrimaryColor,
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: widget.type == LoginButtonType.text ? 14 : 16,
              color: (widget.type == LoginButtonType.outline ||
                      widget.type == LoginButtonType.text)
                  ? usedPrimaryColor
                  : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
