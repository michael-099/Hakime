import 'package:flutter/material.dart';
import './NotificationCard.dart';
import 'TopBar.dart';

class Notifications extends StatelessWidget {
  // Sample data representing notifications
  final List<Map<String, dynamic>> notificationsData = [
    {
      'categories': 'appointment',
      'iconData': Icons.notifications_active,
      'number_of_doctors': '10',
    },
    {
      'categories': 'appointment',
      'iconData': Icons.notifications_active,
      'number_of_doctors': '10',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
      
              Navigator.pop(context);
            },
          ),
          title: Text(
            "HAKIME",
            style: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 20.0),
            // Use the map function to create a list of NotificationCard widgets
            if (notificationsData.isEmpty)
              Center(
                heightFactor: 20,
                child: Text(
                  'No new notifications',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w100),
                ),
              ),
            ...notificationsData.map((notification) {
              return NotificationCard(
                categories: notification['categories'],
                iconData: notification['iconData'],
                number_of_doctors: notification['number_of_doctors'],
              );
            }),
          ],
        ),
      ),
    );
  }
}
