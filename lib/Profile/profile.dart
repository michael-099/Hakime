import "package:flutter/material.dart";
import "banner.dart";
import 'info.dart';

class Profile extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Column(
      children: [
        Baner(),
        Info(text: "Name" ,info:"Jessica"),
        Info(text: "Surname" ,info:"Simpson"),
        Info(text: "Date of Birth" ,info:"july,16,1990"),
        Info(text: "City " ,info:"London"),
        Info(text: "Country" ,info:"Uk"),
        
      ],
    )));
  }
}
