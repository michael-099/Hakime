import "package:flutter/material.dart";
import "../Login/MyTextField.dart";
import '../utils/session.dart';
import "./button.dart";
import './paymentMethods.dart';
import 'profileCard.dart';
import 'docData.dart';
import 'data.dart';

class Details extends StatefulWidget {
  final String name;
  final String specialization;
  final String city;
  final String expriance;
  final String country;
  final String imgs;
  final String pno;

  Details(
      {required this.name,
      required this.specialization,
      required this.city,
      required this.expriance,
      required this.country,
      required this.imgs,
      required this.pno});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  DateTime? selectedDate;
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value) {
      if (value != null) {
        setState(() {
          selectedDate = value;
        });

        // Add your logic to send a request to the server with the selectedDate
        _createSchedule(selectedDate);
      }
    });
  }

  Future<void> _createSchedule(DateTime? selectedDate) async {
    if (selectedDate != null) {
      // Example URL, replace it with your actual server endpoint
      const String scheduleEndpoint = 'http://localhost:5072/api/user/schedule';

      // Example request body, modify it based on your server requirements
      final Map<String, dynamic> requestBody = {
        'selectedTime': selectedDate.toIso8601String(),
        'doctorId': "someone"
        // Add other required parameters
      };

      try {
        final dynamic response = await Session.post(
          scheduleEndpoint,
          requestBody,
        );

        // Handle the response from the server
        if (response.statusCode == 200) {
          print('Request sent successfully');
          print('Server response: ${response.body}');
        } else {
          print('Failed to send request. Status code: ${response.statusCode}');
          print('Error response: ${response.body}');
        }
      } catch (error) {
        print('Error sending request: $error');
      }
    }
  }

  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 450,
        height: 700,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            CircleAvatar(
              backgroundImage: AssetImage(widget.imgs),
              radius: 40,
            ),
            Text(widget.name,
                style: TextStyle(
                    fontSize: 30,
                    color: Color(0xff2E4450).withOpacity(0.90),
                    fontWeight: FontWeight.w200,
                    decoration: TextDecoration.none)),
            ProfileCard(
                name: widget.name,
                specialization: widget.specialization,
                city: widget.city,
                country: widget.country,
                experience: widget.expriance,
                pno: widget.pno),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: dataitems.length,
            //     itemBuilder: (context, index) => ProfileCard(
            //         name: dataitems[index].name,
            //         specialization: dataitems[index].specialization,
            //         city: dataitems[index].city,
            //         country: dataitems[index].city,
            //         experience: dataitems[index].experience),
            //   ),
            // ),
            GestureDetector(
                onTap: () => {Navigator.pop(context)},
                child: const Button(
                  height: 40,
                  label: "Done",
                  width: 200,
                )),
            GestureDetector(
                onTap: _showDatePicker,
                child: const Button(
                  height: 40,
                  label: "Schedule",
                  width: 200,
                ))
          ],
        ),
      ),
    );
  }
}
