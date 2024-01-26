import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  // const name({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('img/Doc.jpeg'),
            radius: 70,

          ),
         ListTile(
  title: Text('Name'),
  subtitle: Text('John'), // Replace 'John' with the actual name
  leading: Icon(Icons.person),
  trailing: Icon(Icons.arrow_forward_ios),
  tileColor: Colors.white, // Adjust color as needed
),
ListTile(
  title: Text('Surname'),
  subtitle: Text('Doe'), // Replace 'Doe' with the actual surname
  leading: Icon(Icons.person),
  trailing: Icon(Icons.arrow_forward_ios),
  tileColor: Colors.grey[100], // Adjust color as needed
),
ListTile(
  title: Text('Date of Birth'),
  subtitle: Text('January 1, 1990'), // Replace with the actual date of birth
  leading: Icon(Icons.calendar_today),
  trailing: Icon(Icons.arrow_forward_ios),
  tileColor: Colors.white, // Adjust color as needed
),
ListTile(
  title: Text('City'),
  subtitle: Text('Your City'), // Replace 'Your City' with the actual city
  leading: Icon(Icons.location_city),
  trailing: Icon(Icons.arrow_forward_ios),
  tileColor: Colors.grey[100], // Adjust color as needed
),
ListTile(
  title: Text('Country'),
  subtitle: Text('Your Country'), // Replace 'Your Country' with the actual country
  leading: Icon(Icons.public),
  trailing: Icon(Icons.arrow_forward_ios),
  tileColor: Colors.white, // Adjust color as needed
),

        ],
      )),
    );
  }
}
