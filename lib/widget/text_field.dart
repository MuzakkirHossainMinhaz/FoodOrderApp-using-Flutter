import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  late final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  // ignore: non_constant_identifier_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  MyTextField({
    required this.hintText,
    required this.obscureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
