import 'package:flutter/material.dart';
import 'profileCard.dart';
import 'data.dart';
import 'edit.dart';

List<Datas> dataitems = [
  Datas(
    content: 'Name',
    subcontent: 'John Doe',
    backIcon: Icons.person,
    frontIcon: Icons.arrow_forward,
  ),
  Datas(
    content: 'Pno',
    subcontent: '+251987654321',
    backIcon: Icons.phone,
    frontIcon: Icons.phone_android_outlined,
  ),
  Datas(
    content: 'Date of Birth',
    subcontent: 'January 1, 1990',
    backIcon: Icons.calendar_today,
    frontIcon: Icons.arrow_forward,
  ),
  Datas(
    content: 'City',
    subcontent: 'New York',
    backIcon: Icons.location_city,
    frontIcon: Icons.arrow_forward,
  ),
  Datas(
    content: 'Country',
    subcontent: 'United States',
    backIcon: Icons.public,
    frontIcon: Icons.location_city,
  ),
];

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Widget getRow(int index) {
    return ProfileCard(
      content: dataitems[index].content,
      subcontent: dataitems[index].subcontent,
      frontIcon: dataitems[index].backIcon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('img/Doc.jpeg'),
              radius: 60,
            ),
            TextButton(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Edit();
                  },
                );
                // Update the UI when the list is modified
                setState(() {});
              },
              child: Text('Edit profile '),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: dataitems.length,
                itemBuilder: (context, index) => getRow(index),
              ),
            ),
            // Place the "Edit" button below the profile content
            
          ],
        ),
      ),
    );
  }
}

// void main() {
//   runApp(Profile());
// }
