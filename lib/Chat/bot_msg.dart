import "package:flutter/material.dart";

class BotMsg extends StatelessWidget {
  final String message;
  BotMsg({required this.message});
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        decoration: const BoxDecoration(
         color: Color.fromARGB(255, 166, 240, 251),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(15.0),
          ),
        ),
        
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),

        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(1.0)),
        constraints: BoxConstraints(
          minHeight: 100, // Set your minimum height
          maxHeight: double.infinity, // Optionally, set a maximum height
          minWidth: MediaQuery.of(context).size.width * 0.80,
          maxWidth: MediaQuery.of(context).size.width * 0.80,
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.android,color: Color(0xff2E4450).withOpacity(0.80),),
                Text(
                  "hakime",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 17,
                    color: Color(0xff2E4450).withOpacity(0.80),
                  ),
                ),
              ],
            ),
            Text(message,
                style: TextStyle(
                  fontSize: 15,
                )),
          ],
        ),
      ),
    );
    ;
  }
}
