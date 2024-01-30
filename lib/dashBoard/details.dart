import "package:flutter/material.dart";
import "../Login/MyTextField.dart";
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
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value) {
      DateTime? pickedDate = value;
    });
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
