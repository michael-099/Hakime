import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hakime/utils/session.dart';
import 'MyTextField.dart';
import '../Login/button.dart';
import 'profile.dart';

class Edit extends StatefulWidget {
  Function()? onUpdate;

  Edit(this.onUpdate);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  late TextEditingController nameController;
  late TextEditingController surnameController;
  late TextEditingController dateOfBirthController;
  late TextEditingController cityController;
  late TextEditingController countryController;
  late String dateOfBirth;
  Map<String, dynamic> profile = Session.cache["user"];

  Future<void> updateProfile() async {
    String userId = Session.state["userId"]!;
    String nameValue = nameController.text;
    String cityValue = cityController.text;
    String updateProfileUrl = "http://localhost:5072/api/user/$userId";

    Map<String, dynamic> updatedProfile = {
      "city": cityValue,
      "fullname": nameValue,
    };
    try {
      final response = await Session.put(updateProfileUrl, updatedProfile);
      print(response.body);
      Map<String, dynamic> decodedResponse = jsonDecode(response.body);
      print(decodedResponse);
      if (response.statusCode == 200) {
        setState(() {
          Map<String, dynamic> temp =
              decodedResponse["user"] as Map<String, dynamic>;
          print(temp);
          Session.cache["user"] = temp;
        });
        print('Profile Update successful.');
      } else {
        print("Error while updating profile");
        print(decodedResponse["errors"] ??
            decodedResponse["error"] ??
            "Unknown error occurred $decodedResponse");
      }
    } catch (error) {
      // print('Something went wrong: $error');
      rethrow;
    }
  }

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController();
    surnameController = TextEditingController();
    dateOfBirthController = TextEditingController();
    cityController = TextEditingController();
    countryController = TextEditingController();

    bool hasName = profile["fullname"] != null &&
        profile["fullname"].toString().length > 0 &&
        profile["fullname"].toString().contains(" ");
    String surName =
        hasName ? profile["fullname"].toString().split(" ")[1] : "";
    String name = hasName ? profile["fullname"] : "";
    String city = hasName ? profile["city"] : "";
    nameController.text = name;
    surnameController.text = surName;
    dateOfBirthController.text = hasName ? "January 1, 1990" : "";
    cityController.text = city;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 350,
        height: 600,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Text(
              "Edit",
              style: TextStyle(
                fontSize: 30,
                color: Color(0xff2E4450).withOpacity(0.90),
                fontWeight: FontWeight.w200,
                decoration: TextDecoration.none,
              ),
            ),
            MyTextField(
              labelText: "Name",
              width: 300,
              obscureText: false,
              color: Color(0xff2E4450).withOpacity(0.60),
              myController: nameController,
            ),
            const SizedBox(
              height: 25,
            ),
            MyTextField(
              labelText: "Surname",
              width: 300,
              obscureText: false,
              color: Color(0xff2E4450).withOpacity(0.60),
              myController: surnameController,
            ),
            const SizedBox(
              height: 25,
            ),
            MyTextField(
              labelText: "Date of Birth",
              width: 300,
              obscureText: false,
              color: Color(0xff2E4450).withOpacity(0.60),
              myController: dateOfBirthController,
            ),
            const SizedBox(
              height: 25,
            ),
            MyTextField(
              labelText: "City",
              width: 300,
              obscureText: false,
              color: Color(0xff2E4450).withOpacity(0.60),
              myController: cityController,
            ),
            const SizedBox(
              height: 25,
            ),
            // MyTextField(
            //   labelText: "Country",
            //   width: 300,
            //   obscureText: false,
            //   color: Color(0xff2E4450).withOpacity(0.60),
            //   myController: countryController,
            // ),
            // const SizedBox(
            //   height: 25,
            // ),
            GestureDetector(
              onTap: () async {
                String dateOfBirthValue = dateOfBirthController.text;
                await updateProfile();
                setState(() {
                  dateOfBirth = dateOfBirthValue;
                  if (widget.onUpdate != null) {
                    widget.onUpdate!();
                    print("widget updated");
                  } else {
                    print("widget function null");
                  }
                });

                Navigator.pop(context);
              },
              child: const Button(
                height: 40,
                radius: 20,
                label: "Continue",
                width: 200,
                fontSize: 20,
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Button(
                height: 40,
                radius: 20,
                label: "Discard",
                width: 200,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
