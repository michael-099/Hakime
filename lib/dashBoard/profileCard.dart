import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String specialization;
  final String city;
  final String experience;
  final String pno;
  final String id;

  ProfileCard(
      {required this.name,
      required this.specialization,
      required this.city,
      required this.experience,
      required this.pno,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text("Name"),
            subtitle: Text(name),
            leading: Icon(Icons.person),
            tileColor: Colors.white,
          ),
          ListTile(
            title: Text("Specilaization"),
            subtitle: Text(specialization),
            leading: Icon(Icons.medical_information),
            tileColor: Colors.white,
          ),
          ListTile(
            title: Text("Expriance"),
            subtitle: Text(experience),
            leading: Icon(Icons.badge),
            tileColor: Colors.white,
          ),
          ListTile(
            title: Text("City"),
            subtitle: Text(city),
            leading: Icon(Icons.location_city),
            tileColor: Colors.white,
          ),
          ListTile(
            title: Text("pno"),
            subtitle: Text(pno),
            leading: Icon(
              Icons.phone,
            ),
            tileColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
