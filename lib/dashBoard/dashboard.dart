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
        home: Column(
          children: [
            TopBar(categories: "HAKIME",iconData: Icons.notifications_active_outlined,number_of_doctors: "fmdk"),
            Search(),
            Ad(),
            CatagoryCard(
              iconData: Icons.heat_pump,
              categories: "cardiology",
              number_of_doctors: "10",
            ),
            SmallerCard(iconData: Icons.notification_add_outlined ,categories: "njkkjnj", number_of_doctors: "number_of_doctors")
            // Pay()
          ],
        ));
  }
}
