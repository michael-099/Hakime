import 'package:flutter/material.dart';
import './scheduleCard.dart';
import '../dashBoard/TopBar.dart';


class Schedules extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(title: Center(child: Text("Schedule" ,style: TextStyle(color:Colors.white) ,)),  backgroundColor:Color.fromARGB(255, 92, 180, 215),),

        body: Column(
          children: [
            // TopBar(
            //     categories: "Schedules",
            //     iconData: Icons.Schedules_active_outlined,
            //     number_of_doctors: "fmdk"),
            SizedBox(height: 20,),
             TopBar(
                  categories: "HAKIME",
                  iconData: Icons.notifications_active_outlined,
                  number_of_doctors: "fmdk"),
            SizedBox(height: 20.0),
            ScheduleCard(
                person: "abebe fkroekf",
                iconData: Icons.phone,
                discription: "appointement was schedule for 10:00 am",
                time:new DateTime(1,1,1,1) ),

            ScheduleCard(
                person: "jhon doe",
                iconData: Icons.phone,
                discription: "10",
                time:new DateTime(1,1,1,1) 
                )
          ],
        ),
      ),
    );
  }
}
// :Color.fromARGB(255, 110, 189, 220)