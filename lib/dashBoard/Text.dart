import 'package:flutter/material.dart';

class TextW extends StatelessWidget {
  const TextW({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child :Text(
      "Recomandations",
      style: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          decoration: TextDecoration.none),
    ),);
  }
}