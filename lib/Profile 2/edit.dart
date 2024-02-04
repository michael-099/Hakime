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
  late TextEditingController emailController;
  late String dateOfBirth;

  /* Here are some examples data for the following variables
  
    profile = {
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
  Map<String, dynamic> profile = Session.cache["user"];

  Future<void> updateProfile() async {
    String userId = Session.state["userId"]!;
    String nameValue = nameController.text;
    String pnoValue = surnameController.text;
    String cityValue = cityController.text;
    String emailValue = emailController.text;
    String updateProfileUrl = "https://03f5-196-188-160-63.ngrok-free.app/api/user/$userId";
    //  String updateProfileUrl = "http://localhost:5072/api/user/$userId";

    Map<String, dynamic> updatedProfile = {
      "city": cityValue,
      "fullname": nameValue,
      "email": emailValue,
      "phonenumber": pnoValue
    };
    try {
      final response = await Session.put(updateProfileUrl, updatedProfile);
      // print(response.body);
      Map<String, dynamic> decodedResponse = jsonDecode(response.body);
      // print(decodedResponse);
      if (response.statusCode == 200) {
        setState(() {
          Map<String, dynamic> temp =
              decodedResponse["user"] as Map<String, dynamic>;
          // print(temp);
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
    emailController = TextEditingController();

    bool hasName = profile["fullname"] != null &&
        profile["fullname"].toString().length > 0 &&
        profile["fullname"].toString().contains(" ");
    String phonenumber = hasName ? profile["phonenumber"].toString() : "";
    String name = hasName ? profile["fullname"] : "";
    String city = hasName ? profile["city"] : "";
    String email = hasName ? profile["email"] : "";
    nameController.text = name;
    surnameController.text = phonenumber;
    dateOfBirthController.text = hasName ? "January 1, 1990" : "";
    cityController.text = city;
    emailController.text = email;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 450,
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
        child: SingleChildScrollView(
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
                width: 200,
                obscureText: false,
                color: Color(0xff2E4450).withOpacity(0.60),
                myController: nameController,
              ),
              const SizedBox(
                height: 25,
              ),
              MyTextField(
                labelText: "email",
                width: 200,
                obscureText: false,
                color: Color(0xff2E4450).withOpacity(0.60),
                myController: emailController,
              ),
              MyTextField(
                labelText: "Pno",
                width: 200,
                obscureText: false,
                color: Color(0xff2E4450).withOpacity(0.60),
                myController: surnameController,
              ),
              const SizedBox(
                height: 15,
              ),
              MyTextField(
                labelText: "Date of Birth",
                width: 200,
                obscureText: false,
                color: Color(0xff2E4450).withOpacity(0.60),
                myController: dateOfBirthController,
              ),
              const SizedBox(
                height: 15,
              ),
              MyTextField(
                labelText: "City",
                width: 200,
                obscureText: false,
                color: Color(0xff2E4450).withOpacity(0.60),
                myController: cityController,
              ),
              const SizedBox(
                height: 15,
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
      ),
    );
  }
}
