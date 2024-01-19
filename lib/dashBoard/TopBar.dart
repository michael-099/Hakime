import "package:flutter/material.dart";
import "package:hakime/Notification/Notification.dart";

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
      height: 50,
      decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.5),
          //     spreadRadius: 1,
          //     blurRadius: 3,
          //     offset: const Offset(0, 2),
          //   ),
          // ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: const Border()),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(children: [
            Text(
              categories,
              style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),

            // alignment: AlignmentGeometry alignment = Alignment.topLeft,
          ]),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Notifications()),
                      );
                    },
                    icon: Icon(Icons.notifications_none_outlined),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
