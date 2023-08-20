import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hint;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green.shade900, width: 2),
              ),
              // hintText: hint,
              // hintStyle: TextStyle(color: Colors.grey.shade500),
              labelText: hint,
              labelStyle: TextStyle(color: Colors.grey.shade700),
              fillColor: Colors.grey.shade300,
              filled: true)),
    );
  }
}
