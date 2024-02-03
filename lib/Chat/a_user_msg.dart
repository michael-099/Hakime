import 'package:flutter/material.dart';

class UserMsg extends StatelessWidget {
  final String message;

  UserMsg({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:  Color(0xfff1f9ff), // Change the color to something attractive
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
          bottomLeft: Radius.circular(15.0),
          bottomRight: Radius.circular(0.0),
        ),
      ),
      constraints: BoxConstraints(
        minHeight: 100,
        maxHeight: double.infinity,
        minWidth: MediaQuery.of(context).size.width,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.person,color: Color(0xff2E4450).withOpacity(0.80),),
              Text(
                "you",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 17,
                  color: Color(0xff2E4450).withOpacity(0.80),
                ),
              ),
            ],
          ),
          Text(
            message,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
