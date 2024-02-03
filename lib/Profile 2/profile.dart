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
  /* Here are some examples data for the following variables
  
    profileData = {
                  "id": "65bcc28f9e7d2e27a91cb82d",
                  "profession": "string",
                  "fullname": "Some one",
                  "phonenumber": "0911926066",
                  "city": "Dire Dawa",
                  "age": 24,
                  "imageUrl": "/ProfilePics/65aa80034e3f9f40cfe50e13_66afa0f9-1df5-415a-a933-46a24a6f7cd0.jpg",
                  "role": "Admin",
                  "email": "user@example.com",
                  "gender": "Male"
                }
   */
  Map<String, dynamic> profileData = Session.cache["user"];

  @override
  initState() {
    super.initState();
    populateList();
  }

  void populateList() {
    bool hasName = profileData["fullname"] != null &&
        profileData["fullname"].toString().length > 0 &&
        profileData["fullname"].toString().contains(" ");
    String surName =
        hasName ? profileData["fullname"].toString().split(" ")[1] : "";
    String name = hasName ? profileData["fullname"] : "";
    String city = hasName ? profileData["city"] : "";
    print("User : $profileData");
    print("Sur name: $surName");
    dataitems = [
      Datas(
          content: "Name",
          subcontent: name,
          backIcon: Icons.person,
          frontIcon: Icons.arrow_forward),
      Datas(
        content: 'Phone number',
        subcontent: surName,
        backIcon: Icons.phone,
        frontIcon: Icons.arrow_forward,
      ),
      Datas(
        content: 'Date of Birth',
        subcontent: hasName ? 'January 1, 1990' : "",
        backIcon: Icons.calendar_today,
        frontIcon: Icons.arrow_forward,
      ),
      Datas(
        content: 'City',
        subcontent: city,
        backIcon: Icons.location_city,
        frontIcon: Icons.arrow_forward,
      ),
       Datas(
        content: 'email',
        subcontent: city,
        backIcon: Icons.mail,
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
