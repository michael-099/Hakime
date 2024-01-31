import "package:flutter/material.dart";
import 'details.dart';

class SmallerCard extends StatelessWidget {
  final String name;
  final String specialization;
  final String img;
  SmallerCard({required this.name, required this.specialization,required this.img});

  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: EdgeInsets.all(7.0),
        width: 350,
        height: 70,
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
            border: const Border()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(img),
                    radius: 25,
                  ),
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff2E4450).withOpacity(0.80),
                            decoration: TextDecoration.none),
                      ),
                      Text(
                        specialization,
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w200,
                            color: Colors.grey[500],
                            decoration: TextDecoration.none),
                        textAlign: TextAlign.left,
                      ),
                    ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
