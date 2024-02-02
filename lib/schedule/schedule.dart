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
/* Here are some examples data for the following variables
  
    schedules = [
                  {
                    "id": "65bcc38e9e7d2e27a91cb82e",
                    "scheduleTime": "2024-01-19T12:36:52.748Z",
                    "confirmed": false,
                    "scheduler": {
                      "id": "65bcb76a801ea8053a6764f3",
                      "fullname": "",
                      "gender": "",
                      "phonenumber": "0911923234",
                      "city": null,
                      "age": null,
                      "imageUrl": null
                    },
                    "doctor": null
                  },
                  {
                    "id": "65bd02035118aa6e14187fd3",
                    "scheduleTime": "2024-02-05T21:00:00Z",
                    "confirmed": false,
                    "scheduler": {
                      "id": "65bcc28f9e7d2e27a91cb82d",
                      "fullname": "Some one",
                      "gender": "Male",
                      "phonenumber": "0911926066",
                      "city": "Dire Dawa",
                      "age": 24,
                      "imageUrl": "/ProfilePics/65aa80034e3f9f40cfe50e13_66afa0f9-1df5-415a-a933-46a24a6f7cd0.jpg"
                    },
                    "doctor": null
                  },
                  	{
                      "id": "65bccab831105b0223e33e36",
                      "scheduleTime": "2024-01-19T12:36:52.748Z",
                      "confirmed": false,
                      "scheduler": null,
                      "doctor": {
                        "specialization": "Medical",
                        "yearOfExperience": 1,
                        "id": "65bcc2789e7d2e27a91cb82c",
                        "fullname": "Yeabesera Derese",
                        "gender": "Male",
                        "phonenumber": "0911926066",
                        "city": "Addis Ababa",
                        "age": 23,
                        "imageUrl": "/ProfilePics/65aa80034e3f9f40cfe50e13_66afa0f9-1df5-415a-a933-46a24a6f7cd0.jpg"
                        }
                    },
                    {
                      "id": "65bd011e5118aa6e14187fd2",
                      "scheduleTime": "2024-02-13T21:00:00Z",
                      "confirmed": false,
                      "scheduler": null,
                      "doctor": {
                        "specialization": "Medical",
                        "yearOfExperience": 1,
                        "id": "65bcc2789e7d2e27a91cb82c",
                        "fullname": "Yeabesera Derese",
                        "gender": "Male",
                        "phonenumber": "0911926066",
                        "city": "Addis Ababa",
                        "age": 23,
                        "imageUrl": "/ProfilePics/65aa80034e3f9f40cfe50e13_66afa0f9-1df5-415a-a933-46a24a6f7cd0.jpg"
                      }
                ]
 */

  List<Map<String, dynamic>> schedules = [];

  @override
  initState() {
    super.initState();
    loadSchedules();
  }

  Future<void> loadSchedules() async {
    try {
      String scheduleEndpoint = 'http://localhost:5072/api/user/schedule';

      final response = await Session.get(scheduleEndpoint);
      Map<String, dynamic> decodedResponse = jsonDecode(response.body);
      // print(decodedResponse);
      if (response.statusCode == 200) {
        setState(() {
          List<Map<String, dynamic>> temp =
              (decodedResponse["schedule"] as List)
                  .cast<Map<String, dynamic>>();
          // print(temp);
          schedules = temp;
        });
        print(
            'Schedules loading successful. Found ${schedules.length} schedules');
      } else {
        print("Error while loading schedules");
        print(decodedResponse["errors"] ??
            decodedResponse["error"] ??
            "Unknown error occurred $decodedResponse");
      }
    } catch (error) {
      print('Something went wrong: $error');
      // rethrow;
    }
  }

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
