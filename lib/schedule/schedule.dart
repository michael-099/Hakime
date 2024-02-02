import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../utils/session.dart';
import './scheduleCard.dart';
import '../dashBoard/TopBar.dart';

class Schedules extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScheduleState();
  }
}

class ScheduleState extends State<Schedules> {
  List<Map<String, dynamic>> schedules = [];

  @override
  initState() {
    super.initState();
    loadSchedules();
  }

  Future<void> loadSchedules() async {
    String userId = Session.state["userId"] ?? "None";
    print("User id : $userId");
    try {
      String scheduleEndpoint = 'http://localhost:5072/api/user/schedule';

      final response = await Session.get(scheduleEndpoint);
      Map<String, dynamic> decodedResponse = jsonDecode(response.body);
      print(decodedResponse);
      if (response.statusCode == 200) {
        setState(() {
          List<Map<String, dynamic>> temp =
              (decodedResponse["schedule"] as List)
                  .cast<Map<String, dynamic>>();
          print(temp);
          schedules = temp;
        });
        print('Message loading successful. Found ${schedules.length} messages');
      } else {
        print("Error while loading messages");
        print(decodedResponse["errors"] ??
            decodedResponse["error"] ??
            "Unknown error occurred $decodedResponse");
      }
    } catch (error) {
      // print('Something went wrong: $error');
      rethrow;
    }
  }

  // Future<void> detailSchedule(String message) async {
  //   try {
  //     String userId = Session.state["userId"] ?? "None";
  //     String chattingEndpoint = 'http://localhost:5072/api/user/$userId/chat';
  //     print("Asking llm with message: $message");
  //     final response = await Session.post(chattingEndpoint, message);

  //     Map<String, dynamic> decodedResponse = jsonDecode(response.body);
  //     print(decodedResponse);

  //     if (response.statusCode == 200) {
  //       setState(() {
  //         aiMessage = decodedResponse["response"];
  //       });
  //       print("Ai response: $aiMessage");
  //     } else {
  //       print('Ai response failed');
  //       print(decodedResponse["errors"] ??
  //           decodedResponse["error"] ??
  //           "Unknown error occurred $decodedResponse");
  //     }
  //   } catch (error) {
  //     // print('Error: $error');
  //     rethrow;
  //   }
  // }

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
            ...schedules.map((schedule) {
              DateTime dateTime = DateTime.parse(schedule['scheduleTime']);
              String formattedDate = DateFormat("yyyy-MM-dd").format(dateTime);
              DateTime currentDate = DateTime.now();
              int daysDifference = dateTime.difference(currentDate).inDays;
              return ScheduleCard(
                person: schedule['doctor']['fullname'],
                discription: schedule['doctor']['specialization'],
                time: "Date $formattedDate",
                remainingDays: "In $daysDifference days",
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
