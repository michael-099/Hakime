import 'package:flutter/material.dart';
import "discription.dart";
import "MyTextField.dart";
import "button.dart";

class Login extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          width: 400,
          height: 500,
          child: Column(
            children: [
              Discription(),
              MyTextField(
                labelText: "Login",
                obscureText: false,
                width: 600,
                color:Colors.green 
                // radius: 20.0,
              ),
              MyTextField(
                labelText: "Password",
                obscureText: true,
                width: 600,
                color:Colors.green 
                // radius: 20.0,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  child: Text(
                    "forget password? ",
                    style: TextStyle(color: Colors.blue[400]),
                  ),
                  onPressed: () {},
                ),
              ),
              Button(
                height: 50,
                label: "Login",
                width: 600,
                radius: 20,
                fontSize: 10,
              ),
            ],
          ),
        ),
      ),
    )));
  }
}
