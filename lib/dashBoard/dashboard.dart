import "package:flutter/material.dart";
import "ad.dart";
import "card.dart";

class dashBoard extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Column(
      children: [
        Ad(),
        CatagoryCard(),
      ],
    ));
  }
}
