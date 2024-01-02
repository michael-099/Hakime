import "package:flutter/material.dart";

class Info extends StatelessWidget {
  final String text;
  final String info;

  Info({required this.text, required this.info});
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Icon(
            Icons.circle_rounded,
            size: 7,
            color: Color.fromARGB(255, 85, 198, 164),
          ),
        ),
        Column(
          children: [
           
            Text(
              text,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                  fontWeight: FontWeight.w300),
              // textAlign: TextAlign.left,
            ),
            Text(
              info,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ],
    ));
  }
}
