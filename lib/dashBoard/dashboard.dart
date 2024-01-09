import "package:flutter/material.dart";
import "ad.dart";
import "card.dart";
import "search.dart";
import 'paymentInfo.dart';


class DashBoard extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Column(
      children: [
        Search(),
        // Ad(),
        // CatagoryCard(iconData: Icons.heat_pump,categories: "cardiology",number_of_doctors: "10",),
        Pay()
      ],
    ));
  }
}
