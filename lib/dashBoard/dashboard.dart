import "package:flutter/material.dart";
import "ad.dart";
import "card.dart";
import "search.dart";
import 'paymentInfo.dart';
import "smallerCard.dart";
import 'TopBar.dart';
import "Text.dart";
import 'docData.dart';

class DashBoard extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TopBar(
                  categories: "HAKIME",
                  iconData: Icons.notifications_active_outlined,
                  number_of_doctors: "fmdk"),
              const SizedBox(
                height: 10,
              ),
              Search(),
              const SizedBox(
                height: 10,
              ),

              Ad(),
              const SizedBox(
                height: 20,
              ),
              TextW(texts: "catagoreis"),
              Container(
                width: 370,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        child: CatagoryCard(
                          iconData: Icons.heat_pump_rounded,
                          categories: "cardiology",
                          number_of_doctors: "10",
                          image: "img/cardiology.png",
                        ),
                      ),
                      Container(
                        child: CatagoryCard(
                          iconData: Icons.heat_pump,
                          categories: "Dermatology",
                          number_of_doctors: "10",
                          image: "img/dermatologically-tested.png",
                        ),
                      ),
                      Container(
                        child: CatagoryCard(
                          iconData: Icons.heat_pump,
                          categories: "Immunology",
                          number_of_doctors: "10",
                          image: "img/immune-system (1).png",
                        ),
                      ),
                      Container(
                        child: CatagoryCard(
                          iconData: Icons.heat_pump,
                          categories: "Pathology",
                          number_of_doctors: "10",
                          image: "img/microscope.png",
                        ),
                      ),
                      Container(
                        child: CatagoryCard(
                          iconData: Icons.heat_pump,
                          categories: "neurology",
                          number_of_doctors: "10",
                          image: "img/neurology.png",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextW(
                texts: "recomandiations",
              ),
              
             
              Column(
                children: dataitems.map((item) {
                  return SmallerCard(
                    name: item.name,
                    specialization: item.specialization,
                   
                  );
                }).toList(),
              ),
            ],
          ),
        ));
  }
}
