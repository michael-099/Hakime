import "package:flutter/material.dart";
import "package:hakime/Login/discription.dart";

class ScheduleCard extends StatelessWidget {
  final IconData iconData;
  final String person;
  final String discription;
  ScheduleCard(
      {required this.iconData,
      required this.person,
      required this.discription});

  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        padding: const EdgeInsets.all(20.0),
        width: 450,
        height: 170,
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
                    ]),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Adjust the radius as needed
                          ),
                        ),
                      ),
                      onPressed: () {
                        // Handle button press
                      },
                      child: Column(
                        children: [
                          Icon(iconData, color: Colors.white, size: 30),
                          Text(
                            "Call",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                       style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Adjust the radius as needed
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Column(
                        children: [
                          Icon(iconData, color: Colors.white, size: 30),
                          Text(
                            "Cancel",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    )
                    ),
                const SizedBox(width: 40),
              ],
            )
          ],
        ),
      ),
    );
  }
}
