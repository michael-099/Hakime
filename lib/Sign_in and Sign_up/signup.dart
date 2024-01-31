import 'package:flutter/material.dart';
// import 'package:namer_app/Sign_in%20and%20Sign_up/signin.dart';
import 'MyTextField.dart';
import 'button.dart';
import "signin.dart";

class SignUp extends StatelessWidget {
  final TextEditingController textController = TextEditingController();
  final TextEditingController textController2 = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Sign Up",
                style: TextStyle(
                    fontSize: 40,
                    color: Color.fromARGB(255, 117, 116, 114),
                    fontWeight: FontWeight.w600)),
            const MyTextField(
              labelText: "User Name",
              obscureText: false,
              radius: 10,
              width: 500,
            ),
            const MyTextField(
              labelText: "Email",
              obscureText: false,
              radius: 10,
              width: 500,
            ),
            const MyTextField(
              labelText: "password",
              obscureText: true,
              radius: 10,
              width: 500,
            ),
            Button(
                label: "sign up ",
                width: MediaQuery.of(context).size.width * 1,
                height: 50),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      child: Text(
                        "sign in",
                        style: TextStyle(color: Colors.blue[400]),
                        textAlign: TextAlign.right,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignIn()));
                      },
                    )
                  ]),
            ),
          ],
        ),
      ),
      // ),
    ));
  }
}
