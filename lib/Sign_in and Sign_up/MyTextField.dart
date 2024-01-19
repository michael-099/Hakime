import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final double width;
  final double radius;

  const MyTextField(
      {required this.labelText,
      required this.obscureText,
      required this.width,
      required this.radius});
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextField(
        obscureText: obscureText,
        //  controller: textController2,
        decoration: InputDecoration(
          labelText: labelText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
    );
  }
}
