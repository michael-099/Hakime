import 'dart:convert';

import 'package:flutter/material.dart';
import 'signup.dart';
import 'MyTextField.dart';
import 'button.dart';
import 'dropdown.dart';
import 'discription.dart';
import 'package:http/http.dart' as http;

class SignIn extends StatelessWidget {
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      labelText: "password",
                      obscureText: true,
                      width: 400,
                      color: Colors.green,
                      myController: passwordController,
                    ),
                    GestureDetector(
                      child: Button(
                        height: 50,
                        label: "Sign In",
                        width: 600,
                        radius: 20,
                        fontSize: 10,
                      ),
                      onTap: () async {
                        Future<void> authenticateUser() async {
                          String email = EmailController.text;
                          String pass = passwordController.text;

                          try {
                            final String authenticationEndpoint = 'http://localhost:5072/api/auth/login';

                            final Map<String, String> headers = {
                              'Content-Type': 'application/json',
                            };

                            final Map<String, String> body = {
                              'email': email,
                              'password': pass,
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
                              print('Authentication failed');
                              // Show alert dialog in case of authentication failure
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Authentication Failed'),
                                    content: Text('Please check your credentials and try again.'),
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
                            // Show alert dialog in case of an error
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Error'),
                                  content: Text('An error occurred. Please try again later.'),
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
                        "Sign UP",
                        style: TextStyle(color: Colors.blue[400]),
                        textAlign: TextAlign.right,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUp(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
