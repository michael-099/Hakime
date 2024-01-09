import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final double width;
  final Color color;
  // final double radius;

  const MyTextField({
    required this.labelText,
    required this.obscureText,
    required this.width,
    required this.color ,
    // rrequired this.radius
  });
  Widget build(BuildContext context) {
    return Container(
      width: width,
      // color:Colors.green,
      child: TextField(
          // style: TextStyle(color: Colors.green),
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle:  TextStyle(color:color.withOpacity(0.5) ,fontSize: 12),
            enabledBorder:  UnderlineInputBorder(
              borderSide: BorderSide(color: color),
            ),
            focusedBorder:  UnderlineInputBorder(
              borderSide: BorderSide(color: color),
            ),
          )),
    );
  }
}
