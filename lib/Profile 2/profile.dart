import 'package:flutter/material.dart';
import '../utils/session.dart';
import 'profileCard.dart';
import 'data.dart';
import 'edit.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<Datas> dataitems = [];
  Map<String, dynamic> profileData = Session.cache["user"];

  @override
  initState() {
    super.initState();
    populateList();
  }

  void populateList() {
    print("User : $profileData");
    print("Sur name: ${profileData["fullname"].toString().split(" ")}");
    dataitems = [
      Datas(
          content: "Name",
          subcontent: profileData["fullname"],
          backIcon: Icons.person,
          frontIcon: Icons.arrow_forward),
      Datas(
        content: 'Surname',
        subcontent: profileData["fullname"].toString().split(" ")[1],
        backIcon: Icons.person,
        frontIcon: Icons.arrow_forward,
      ),
      Datas(
        content: 'Date of Birth',
        subcontent: 'January 1, 1990',
        backIcon: Icons.calendar_today,
        frontIcon: Icons.arrow_forward,
      ),
      Datas(
        content: 'City',
        subcontent: profileData["city"],
        backIcon: Icons.location_city,
        frontIcon: Icons.arrow_forward,
      ),
    ];
  }

  void updateProfile() {
    setState(() {
      profileData = Session.cache["user"];
      populateList();
    });
  }

  Widget getRow(int index) {
    if (index < dataitems.length) {
      return ProfileCard(
        content: dataitems[index].content,
        subcontent: dataitems[index].subcontent,
        frontIcon: dataitems[index].backIcon,
      );
    } else {
      return ProfileCard(
          content: "", subcontent: "", frontIcon: Icons.arrow_forward);
    }
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
                    return Edit(updateProfile);
                  },
                );
                // Update the UI when the list is modified
                setState(() {
                  profileData = Session.cache["user"];
                  populateList();
                });
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
