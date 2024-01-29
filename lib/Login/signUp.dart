import 'package:flutter/material.dart';
// import 'package:namer_app/Sign_in%20and%20Sign_up/signin.dart';
import 'MyTextField.dart';
import 'button.dart';
import "signin.dart";
import "discription.dart";
import "dropdown.dart";

class SignUp extends StatelessWidget {
  final TextEditingController textController = TextEditingController();
  final TextEditingController textController2 = TextEditingController();
  final List<String> dropdown = ["Male", "Female"];
    final List<String> dropdown2 = ["Normal", "Admin", "Doctor"];
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
         padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Discription(),
                 const MyTextField(
                     labelText: "Email",
                     obscureText: false,
                     width: 400,
                     color: Colors.green
                     // radius: 20.0,
                     ),
                 const MyTextField(
                     labelText: "Phone Number",
                     obscureText: false,
                     width: 400,
                     color: Colors.green
                     // radius: 20.0,
                     ),
                  
                 //  MyDropdownButton(options: ,),
                  
                 const MyTextField(
                     labelText: "password",
                     obscureText: true,
                     width: 400,
                     color: Colors.green
                     // radius: 20.0,
                     ),
                 const MyTextField(
                     labelText: "confirmPassword",
                     obscureText: true,
                     width: 400,
                     color: Colors.green
                     // radius: 20.0,
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
                  Button(
                      height: 50,
                      label: "Sign Up",
                      width: 600,
                      radius: 20,
                      fontSize: 10,
                    ),
                 
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
        ));
  }
}
