import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  // const name({super.key});
  final String content;
  final String subcontent;
  final IconData frontIcon;
  final IconData backIcon;


  Profile({
    required this.content,
    required this.subcontent,
    required this.frontIcon,
    required this.backIcon
  }),

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(content),
      subtitle: Text(subcontent), 
      leading: Icon(frontIcon),
      trailing: Icon(backIcon),
      tileColor: Colors.white, // Adjust color as needed
    );
  }
}
