import 'package:flutter/material.dart';
import './NotificationCard.dart';

class Notifications extends StatelessWidget {
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text("Notification" ,style: TextStyle(color:Colors.white) ,)),  backgroundColor:Color.fromARGB(255, 92, 180, 215),),
          body: Column(
          children: [
            SizedBox(height:20.0),
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