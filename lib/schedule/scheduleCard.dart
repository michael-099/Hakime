import "package:flutter/material.dart";
import "package:hakime/Login/discription.dart";

class ScheduleCard extends StatelessWidget {
 
  final String person;
  final String discription;
  final DateTime time;
  ScheduleCard(
      {
      required this.person,
      required this.discription,
      required this.time});

  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        padding: const EdgeInsets.all(20.0),
        width: 450,
        height: 110,
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
        child: Row(
          children: [
            Icon(Icons.calendar_month_outlined,size: 40,color: Colors.lightBlue.withOpacity(0.5),),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            person,
                            style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                decoration: TextDecoration.none),
                          ),
            
                          // alignment: AlignmentGeometry alignment = Alignment.topLeft,
                          Text(
                            discription,
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w200,
                                color: Colors.grey[500],
                                decoration: TextDecoration.none),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            time.toString(),
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
          ],
        ),
      ),
    );
  }
}
