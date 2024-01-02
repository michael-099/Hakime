import "package:flutter/material.dart";

class UserMsg extends StatelessWidget {
  final String message;
  UserMsg({required this.message});
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
          bottomLeft: Radius.circular(15.0),
          bottomRight: Radius.circular(0.0),
        ),
      ),
      constraints: BoxConstraints(
        minHeight: 100, // Set your minimum height
        maxHeight: double.infinity, // Optionally, set a maximum height
        minWidth: MediaQuery.of(context).size.width * 0.99,
        maxWidth: MediaQuery.of(context).size.width * 0.99,
      ),
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.fromLTRB(
        100.0,
        16.016,
        16.0,
        16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.person_off_outlined),
              Text(
                "user",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Text(
            message,
          )
        ],
      ),
    );
  }
}
