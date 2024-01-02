import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final double width;
  // final double radius;

  const MyTextField({
    required this.labelText,
    required this.obscureText,
    required this.width,
    // rrequired this.radius
  });
  Widget build(BuildContext context) {
    return Container(
      width: width,
      // color:Colors.green,
      child: TextField(
          style: TextStyle(color: Colors.green),
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(
              color: Colors.green,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
            ),
          )),
    );
  }
}
