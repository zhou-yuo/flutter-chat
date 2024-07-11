import 'dart:ui';

import 'package:flutter/material.dart';

class BackdropFilterBlur extends StatefulWidget {
  final Widget child;
  const BackdropFilterBlur({required this.child, super.key});

  @override
  State<BackdropFilterBlur> createState() => _BackdropFilterBlurState();
}

class _BackdropFilterBlurState extends State<BackdropFilterBlur> {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
