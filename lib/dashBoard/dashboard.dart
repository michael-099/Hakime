import "package:flutter/material.dart";
import "ad.dart";
import "card.dart";
import "search.dart";
import 'paymentInfo.dart';
import "smallerCard.dart";
import 'TopBar.dart';

class DashBoard extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SingleChildScrollView(
          child: Column(
            children: [
              TopBar(
                  categories: "HAKIME",
                  iconData: Icons.notifications_active_outlined,
                  number_of_doctors: "fmdk"),
              Search(),
              Ad(),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "catagoreis",
                  style: const TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      decoration: TextDecoration.none),
                ),
              ),
              Container(
                width: 370,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        child: CatagoryCard(
                          iconData: Icons.heat_pump,
                          categories: "cardiology",
                          number_of_doctors: "10",
                        ),
                      ),
                      Container(
                        child: CatagoryCard(
                          iconData: Icons.heat_pump,
                          categories: "cardiology",
                          number_of_doctors: "10",
                        ),
                      ),
                      Container(
                        child: CatagoryCard(
                          iconData: Icons.heat_pump,
                          categories: "cardiology",
                          number_of_doctors: "10",
                        ),
                      ),
                      Container(
                        child: CatagoryCard(
                          iconData: Icons.heat_pump,
                          categories: "cardiology",
                          number_of_doctors: "10",
                        ),
                      ),
                      Container(
                        child: CatagoryCard(
                          iconData: Icons.heat_pump,
                          categories: "cardiology",
                          number_of_doctors: "10",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          
              
              SmallerCard(
                  iconData: Icons.notification_add_outlined,
                  categories: "njkkjnj",
                  number_of_doctors: "number_of_doctors"),
              SmallerCard(
                  iconData: Icons.notification_add_outlined,
                  categories: "njkkjnj",
                  number_of_doctors: "number_of_doctors"),
              SmallerCard(
                  iconData: Icons.notification_add_outlined,
                  categories: "njkkjnj",
                  number_of_doctors: "number_of_doctors"),
              SmallerCard(
                  iconData: Icons.notification_add_outlined,
                  categories: "njkkjnj",
                  number_of_doctors: "number_of_doctors"),
              SmallerCard(
                  iconData: Icons.notification_add_outlined,
                  categories: "njkkjnj",
                  number_of_doctors: "number_of_doctors"),
              SmallerCard(
                  iconData: Icons.notification_add_outlined,
                  categories: "njkkjnj",
                  number_of_doctors: "number_of_doctors"),
          
              // Pay()
            ],
          ),
        ));
  }
}
