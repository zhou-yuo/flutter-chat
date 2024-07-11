import 'package:flutter/material.dart';

class LoginInput extends StatefulWidget {
  final TextEditingController control;
  final String? hintText;
  final bool? obscureText;
  const LoginInput(this.control, {this.hintText, this.obscureText, super.key});

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(44, 44, 44, 0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        controller: widget.control,
        obscureText: widget.obscureText ?? false,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
          border: InputBorder.none,
          isCollapsed: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 11, horizontal: 12),
          counterText: '', // maxlength word limit
          hintText: widget.hintText ?? '', // placeholder
          hintStyle: const TextStyle(color: Colors.black54),
        ),
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black87,
        ),
        maxLines: 1,
        maxLength: 16,
      ),
    );
  }
}
