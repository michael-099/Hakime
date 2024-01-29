import "package:flutter/material.dart";
import "../Login/MyTextField.dart";
import "./button.dart";
import './paymentMethods.dart';
import 'profileCard.dart';
import 'docData.dart';

class Details extends StatelessWidget {
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
            const CircleAvatar(
              backgroundImage: AssetImage('img/Doc.jpeg'),
              radius: 40,
            ),
            Text("Abebe Kebede",
                style: TextStyle(
                    fontSize: 30,
                    color: Color(0xff2E4450).withOpacity(0.90),
                    fontWeight: FontWeight.w200,
                    decoration: TextDecoration.none)),
            // Expanded(
            //   child: ListView(
            //     children: dataitems.map((item) {
                  
            //     }).toList(),
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
