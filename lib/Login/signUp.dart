import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:namer_app/Sign_in%20and%20Sign_up/signin.dart';
import 'MyTextField.dart';
import 'button.dart';
import "signin.dart";
import "discription.dart";
import "dropdown.dart";
import 'package:http/http.dart' as http;

class SignUp extends StatelessWidget {
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController pnoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final List<String> dropdown = ["Male", "Female"];
  final List<String> dropdown2 = ["Normal", "Admin", "Doctor"];
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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

        //  MyDropdownButton(options: ,),

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
            ),
            const SizedBox(
              width: 100,
            ),
            MyDropdownButton(
              options: dropdown2,
              option1: dropdown2[0],
              label: "Role",
            ),
          ],
        ),
        // ignore: prefer_const_constructors
        TextButton(
          child: Text(
            "sign in",
            style: TextStyle(color: Colors.blue[400]),
            textAlign: TextAlign.right,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignIn()));
          },
        ),

        GestureDetector(
            child: Button(
              height: 50,
              label: "Sign Up",
              width: 600,
              radius: 20,
              fontSize: 10,
            ),
            onTap: () async {
              Future<void> authenticateUser() async {
                String email = EmailController.text;
                // String pno = pnoController.text;
                String pass = passwordController.text;
                String gender = "M";
                String phone = pnoController.text;
                String role = "Normal";
                String confirmPass = confirmPasswordController.text;
                print(email);
                // print(pno);
                print(pass);

                try {
                  final String authenticationEndpoint =
                      'http://localhost:5072/api/auth/signup'; // Replace with your actual backend URL

                  final Map<String, String> headers = {
                    'Content-Type': 'application/json',
                    // Add any additional headers if required
                  };

                  final Map<String, String> body = {
                    'email': email, // Replace with the actual email
                    'password': pass, // Replace with the actual password
                    "gender": gender,
                    "phonenumber": phone,
                    "role": role,
                    "confirmPassword": confirmPass
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
                    // print('Authentication failed');
                  }
                } catch (error) {
                  print('Error: $error');
                }
              }

              authenticateUser();
            })
      ]),
    ));
  }
}
