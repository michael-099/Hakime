// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'MyTextField.dart';
import 'button.dart';
import 'signin.dart';
import 'discription.dart';
import 'dropdown.dart';
import 'package:http/http.dart' as http;

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
  String roleval = "";

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Discription(),
            MyTextField(
              labelText: "Email",
              obscureText: false,
              width: 400,
              color: Colors.green,
              myController: EmailController,
            ),
            MyTextField(
              labelText: "Phone Number",
              obscureText: false,
              width: 400,
              color: Colors.green,
              myController: pnoController,
            ),
            MyTextField(
              labelText: "password",
              obscureText: true,
              width: 400,
              color: Colors.green,
              myController: passwordController,
            ),
            MyTextField(
              labelText: "confirmPassword",
              obscureText: true,
              width: 400,
              color: Colors.green,
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

                    final Map<String, String> headers = {
                      'Content-Type': 'application/json',
                    };

                    final Map<String, String> body = {
                      'email': email,
                      'password': pass,
                      "gender": gender,
                      "phonenumber": phone,
                      "role": role,
                      "confirmPassword": confirmPass,
                    };

                    final response = await http.post(
                      Uri.parse(authenticationEndpoint),
                      headers: headers,
                      body: jsonEncode(body),
                    );

                    if (response.statusCode == 200) {
                      print('Authentication successful');
                      print('Response Body: ${response.body}');
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
          ],
        ),
      ),
    );
  }
}
