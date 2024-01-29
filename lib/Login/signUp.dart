import 'package:flutter/material.dart';
import "discription.dart";
import "MyTextField.dart";
import "button.dart";
import "dropdown.dart";

class SignUp extends StatelessWidget {
  Widget build(BuildContext context) {
    final List<String> dropdown=["Male","Female"];
    final List<String> dropdown2=["Normal", "Admin", "Doctor"];

    return MaterialApp(
        home: Scaffold(
            body: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          width: 400,
          child: Column(
            children: [
              Discription(),
              const MyTextField(
                  labelText: "Email",
                  obscureText: false,
                  width: 600,
                  color: Colors.green
                  // radius: 20.0,
                  ),

              Row(
                children:  [
                 
              
                  const MyTextField(
                      labelText: "Phone Number",
                      obscureText: true,
                      width: 200,
                      color: Colors.green
                      // radius: 20.0,
                      ),
                          const SizedBox(
                    width: 50,
                  ),
                       MyDropdownButton(options:dropdown ,option1: dropdown[0],label: "gender",),
                ],

              ),
              //  MyDropdownButton(options: ,),
              const MyTextField(
                  labelText: "Profession",
                  obscureText: true,
                  width: 600,
                  color: Colors.green
                  // radius: 20.0,
                  ),
                 MyDropdownButton(options:dropdown2 ,option1: dropdown2[0],label: "Role",),
              const MyTextField(
                  labelText: "password",
                  obscureText: true,
                  width: 600,
                  color: Colors.green
                  // radius: 20.0,
                  ),
              const MyTextField(
                  labelText: "confirmPassword",
                  obscureText: true,
                  width: 600,
                  color: Colors.green
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
              const Button(
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
