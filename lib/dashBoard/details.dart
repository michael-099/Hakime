import "package:flutter/material.dart";
import "../Login/MyTextField.dart";
import "./button.dart";
import './paymentMethods.dart';
import 'profileCard.dart';
import 'docData.dart';
import 'data.dart';

class Details extends StatelessWidget {
  final String name;
  final String specialization;
  final String city;
  final String expriance;
  final String country;
  final String imgs;

  Details(
      {required this.name,
      required this.specialization,
      required this.city,
      required this.expriance,
      required this.country,
      required this.imgs});
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 450,
        height: 600,
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
              backgroundImage: AssetImage(imgs),
              radius: 40,
            ),
            Text(name,
                style: TextStyle(
                    fontSize: 30,
                    color: Color(0xff2E4450).withOpacity(0.90),
                    fontWeight: FontWeight.w200,
                    decoration: TextDecoration.none)),
            ProfileCard(
                name: name,
                specialization: specialization,
                city: city,
                country: country,
                experience: expriance),
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
                ))
          ],
        ),
      ),
    );
  }
}
