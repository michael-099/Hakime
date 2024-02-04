import "package:flutter/material.dart";

class CatagoryCard extends StatelessWidget {
  final IconData iconData;
  final String categories;
  final String number_of_doctors;
  final String image;
  final String description;
  CatagoryCard(
      {required this.iconData,
      required this.categories,
      required this.number_of_doctors,
      required this.image,
      required this.description});

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
                child: Image.asset(
                  image,
                  width: 35.0,
                  height: 35.0,
                  fit: BoxFit.cover, // Adjust the BoxFit as needed
                ),
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
                          color: Color(0xff2E4450).withOpacity(0.80),
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
                  Text(
                    "Category description",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff2E4450).withOpacity(0.80),
                        decoration: TextDecoration.none),
                  ),

                  // alignment: AlignmentGeometry alignment = Alignment.topLeft,
                  Row(children: [
                    Text(
                      "Short description of what $categories is",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w200,
                          color: Colors.grey[400],
                          decoration: TextDecoration.none),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(width: 40),
                    Text(
                      description,
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
