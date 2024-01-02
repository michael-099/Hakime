import "package:flutter/material.dart";

class BotMsg extends StatelessWidget {
  final String message;
  BotMsg({required this.message});
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 47, 90, 124),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(15.0),
          ),
        ),
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.fromLTRB(16.0, 16.0, 100.0, 16.0),

        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(1.0)),
        constraints: BoxConstraints(
          minHeight: 100, // Set your minimum height
          maxHeight: double.infinity, // Optionally, set a maximum height
          minWidth: MediaQuery.of(context).size.width * 0.99,
          maxWidth: MediaQuery.of(context).size.width * 0.99,
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.chat_bubble),
                Text(
                  "bot",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Text(message)
          ],
        ),
      ),
    );
    ;
  }
}
