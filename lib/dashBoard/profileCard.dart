import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name ;
  final String specialization;


  


  final IconData frontIcon;

  ProfileCard({
    required this.content,
    required this.subcontent,
    required this.frontIcon,
  });
 

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text("Name"),
            subtitle: Text(name),
            leading: Icon( Icons.person),
            tileColor: Colors.white,
          ),
          ListTile(
            title: Text("Specilaization"),
            subtitle: Text(specialization,
            leading: Icon(Icons.medical_information),
            tileColor: Colors.white,
          ),
           ListTile(
            title: Text("Expriance"),
            subtitle: Text(expriance),
            leading: Icon(frontIcon),
            tileColor: Colors.white,
          ),
          ListTile(
            title: Text("City"),
            subtitle: Text(city),
            leading: Icon(Icons.location_city),
            tileColor: Colors.white,
          ),
          ListTile(
            title: Text("Country"),
            subtitle: Text(country),
            leading: Icon(Icons.place_sharp,),
            tileColor: Colors.white,
          ),
         
        ],
      ),
    );
  }
}
