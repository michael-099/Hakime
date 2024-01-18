// import 'package:flutter/material.dart';

// class TopBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [Text("HAKIME"), Icon(Icons.notification_add)],
//     );
//   }
// }
import "package:flutter/material.dart";

class TopBar extends StatelessWidget {
  final IconData iconData;
  final String categories;
  final String number_of_doctors;
  TopBar(
      {required this.iconData,
      required this.categories,
      required this.number_of_doctors});

  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: 350,
      height: 60,
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
                      categories,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          decoration: TextDecoration.none),
                    ),

                    // alignment: AlignmentGeometry alignment = Alignment.topLeft,
                    
                  ]),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(iconData,
                    color: const Color.fromARGB(255, 221, 17, 3), size: 40),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
