import "package:flutter/material.dart";
import "ad.dart";
import "card.dart";
import "search.dart";


class DashBoard extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Column(
      children: [
        Search(),
        Ad(),
        CatagoryCard(),
      ],
    ));
  }
}
