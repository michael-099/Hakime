import 'package:flutter/material.dart';
import './scheduleCard.dart';
import '../dashBoard/TopBar.dart';

class Schedules extends StatelessWidget {
  // Sample data representing schedules
  final List<Map<String, dynamic>> schedulesData = [
    {
      'person': 'abebe fkroekf',
      'iconData': Icons.phone,
      'description': 'Appointment was scheduled for 10:00 am',
      'time': DateTime(2024, 1, 31, 10, 0),
    },
    {
      'person': 'john doe',
      'iconData': Icons.phone,
      'description': 'Some description here',
      'time': DateTime(2024, 1, 31, 12, 30),
    },
    {
      'person': 'john doe',
      'iconData': Icons.phone,
      'description': 'Some description here',
      'time': DateTime(2024, 1, 31, 12, 30),
    },
    // Add more schedule data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 20.0),
            TopBar(
              categories: "HAKIME",
              iconData: Icons.notifications_active_outlined,
              number_of_doctors: "fmdk",
            ),
            SizedBox(height: 20.0),
            // Use the map function to create a list of ScheduleCard widgets
            ...schedulesData.map((schedule) {
              return ScheduleCard(
                person: schedule['person'],
                discription: schedule['description'],
                time: schedule['time'],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
