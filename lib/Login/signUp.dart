// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import '../utils/session.dart';
import 'MyTextField.dart';
import 'button.dart';
import 'signin.dart';
import 'discription.dart';
import 'dropdown.dart';
import 'package:http/http.dart' as http;
import "../main/Main.dart";

class SignUp extends StatelessWidget {
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController pnoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final dropdownController = TextEditingController();
  final dropdownController2 = TextEditingController();
  final List<String> dropdown = ["Male", "Female"];
  final List<String> dropdown2 = ["Normal", "Admin", "Doctor"];
  String genderval = "";
  String roleval = "Normal";

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Discription(
              text1: "Create your Account here",
              text2: "welcome",
            ),
            MyTextField(
              labelText: "Email",
              obscureText: false,
              width: 400,
              color: Colors.blue,
              myController: EmailController,
            ),
            MyTextField(
              labelText: "Phone Number",
              obscureText: false,
              width: 400,
              color: Colors.blue,
              myController: pnoController,
            ),
            MyTextField(
              labelText: "password",
              obscureText: true,
              width: 400,
              color: Colors.blue,
              myController: passwordController,
            ),
            MyTextField(
              labelText: "confirmPassword",
              obscureText: true,
              width: 400,
              color: Colors.blue,
              myController: confirmPasswordController,
            ),
            Row(
              children: [
                MyDropdownButton(
                  options: dropdown,
                  option1: dropdown[0],
                  label: "gender",
                  onChanged: (value) {
                    genderval = value;
                  },
                ),
                const SizedBox(
                  width: 100,
                ),
                MyDropdownButton(
                  options: dropdown2,
                  option1: dropdown2[0],
                  label: "Role",
                  onChanged: (value) {
                    roleval = value;
                  },
                ),
              ],
            ),
            GestureDetector(
              child: const Button(
                height: 50,
                label: "Sign Up",
                width: 600,
                radius: 20,
                fontSize: 10,
              ),
              onTap: () async {
                Future<void> authenticateUser() async {
                  String email = EmailController.text;
                  String pass = passwordController.text;
                  String gender = genderval;
                  String phone = pnoController.text;
                  String role = roleval;
                  String confirmPass = confirmPasswordController.text;
                  print(genderval);
                  print(roleval);
                  try {
                    const String authenticationEndpoint =
                        'http://localhost:5072/api/auth/signup';

                    final Map<String, String> body = {
                      'email': email,
                      'password': pass,
                      "gender": genderval,
                      "phonenumber": phone,
                      "role": roleval,
                      "confirmPassword": confirmPass,
                    };
                    print(roleval);

                    final response =
                        await Session.post(authenticationEndpoint, body);

                    if (response.statusCode == 201) {
                      print('Authentication successful');
                      print('Response Body: ${response.body}');

                      // Navigate to the desired page (replace `YourPage` with the actual page)
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn()),
                      );
                    } else {
                      print(response.body);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Registration Failed'),
                            content: Text('Error: ${response.body}'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  } catch (error) {
                    print('Error: $error');
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text(
                              'An error occurred. Please try again later.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                }

                authenticateUser();
              },
            ),
            TextButton(
              child: Text(
                "sign in",
                style: TextStyle(color: Colors.blue[400]),
                textAlign: TextAlign.right,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignIn()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
