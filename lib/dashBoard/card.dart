import "package:flutter/material.dart";

class CatagoryCard extends StatelessWidget {
  final IconData iconData;
  final String categories;
  final String number_of_doctors;
  CatagoryCard(
      {required this.iconData,
      required this.categories,
      required this.number_of_doctors});

  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14.0),
      margin: EdgeInsets.all(15.0),
      width: 350,
      height: 150,
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
                padding: const EdgeInsets.only(right: 10),
                child: Icon(iconData,
                    color: const Color.fromARGB(255, 221, 17, 3), size: 40),
              ),
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
                    Text(
                      number_of_doctors + " doctors",
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
          const SizedBox(height: 30),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Patient  catagory",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),

                  // alignment: AlignmentGeometry alignment = Alignment.topLeft,
                  Row(children: [
                    Text(
                      "some description",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w200,
                          color: Colors.grey[400],
                          decoration: TextDecoration.none),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(width: 40),
                    Text(
                      "some description",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w200,
                          color: Colors.grey[400],
                          decoration: TextDecoration.none),
                      textAlign: TextAlign.left,
                    )
                  ]),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
