import 'package:flutter/material.dart';
import './NotificationCard.dart';
import 'TopBar.dart';

class Notifications extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(title: Center(child: Text("Notification" ,style: TextStyle(color:Colors.white) ,)),  backgroundColor:Color.fromARGB(255, 92, 180, 215),),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Navigate back when the back icon is tapped
              Navigator.pop(context);
            },
          ),
          title: Text("HAKIME",
          style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  decoration: TextDecoration.none),),
          // actions: [
          //   IconButton(
          //     icon: Icon(Icons.notifications_active_outlined),
          //     onPressed: () {
          //       // Handle notifications button tap
          //     },
          //   ),
          // ],
        ),
        body: Column(
          children: [
            SizedBox(height: 20.0),
            NotificationCard(
                categories: "appointment",
                iconData: Icons.notifications_active,
                number_of_doctors: "10"),
            NotificationCard(
                categories: "appointment",
                iconData: Icons.notifications_active,
                number_of_doctors: "10")
          ],
        ),
      ),
    );
  }
}
// :Color.fromARGB(255, 110, 189, 220)