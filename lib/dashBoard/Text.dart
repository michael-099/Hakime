import 'package:flutter/material.dart';

class TextW extends StatelessWidget {
  final String texts;

  TextW({
    required this.texts,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          texts,
          style:  TextStyle(
              fontSize: 19.0,
              fontWeight: FontWeight.w600,
              color: Color(0xff2E4450),
              decoration: TextDecoration.none),
        ),
      ),
    );
  }
}
