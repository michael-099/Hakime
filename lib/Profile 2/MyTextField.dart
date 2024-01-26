import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final double width;
  final Color color;
  final TextEditingController myController;
  // final double radius;

  MyTextField({
    required this.labelText,
    required this.obscureText,
    required this.width,
    required this.color,
    // rrequired this.radius
    required this.myController,
  });
  Widget build(BuildContext context) {
    return Container(
      width: width,
      // color:Colors.green,
      child: TextField(
          // style: TextStyle(color: Colors.green),
          controller: myController,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(color: color.withOpacity(0.5), fontSize: 12),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: color),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: color),
            ),
          )),
    );
  }
}
