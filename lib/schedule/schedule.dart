import 'package:flutter/material.dart';
import './scheduleCard.dart';


class Notifications extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(title: Center(child: Text("Notification" ,style: TextStyle(color:Colors.white) ,)),  backgroundColor:Color.fromARGB(255, 92, 180, 215),),

        body: Column(
          children: [
            // TopBar(
            //     categories: "Notifications",
            //     iconData: Icons.notifications_active_outlined,
            //     number_of_doctors: "fmdk"),
            SizedBox(height: 20.0),
            ScheduleCard(
                categories: "appointment",
                iconData: Icons.notifications_active,
                number_of_doctors: "10"),
            ScheduleCard(
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