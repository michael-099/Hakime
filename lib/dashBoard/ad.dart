import "package:flutter/material.dart";

class Ad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(18.0)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.asset(
          'img/Doc.jpeg',
          width: 400.0,
          height: 200.0,
        ),
      ),
      
    );
  }
}
