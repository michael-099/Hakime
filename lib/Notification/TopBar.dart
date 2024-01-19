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
        width: 450,
        height: 50,
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
            color:  Colors.white,
            border: const Border()),
        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align children to the start (top)
          children: [
            Icon(Icons.arrow_back_ios_new),
            SizedBox(width: 8.0), // Add some space between the icon and text
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align text to the start (left)
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center text vertically
                children: [
                  Text(
                    categories,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
