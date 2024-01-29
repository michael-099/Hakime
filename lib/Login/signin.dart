import 'package:flutter/material.dart';
// import 'package:namer_app/Sign_in%20and%20Sign_up/signup.dart';
import 'signup.dart';
import 'MyTextField.dart';
import 'button.dart';
import 'dropdown.dart';
import 'discription.dart';

class SignIn extends StatelessWidget {
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController pnoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Discription(),
                    MyTextField(
                        labelText: "Email",
                        obscureText: false,
                        width: 400,
                        color: Colors.green,
                        // radius: 20.0,
                        myController: EmailController,
                        ),
                    MyTextField(
                        labelText: "Phone Number",
                        obscureText: false,
                        width: 400,
                        color: Colors.green,
                        // radius: 20.0,
                        myController: pnoController,
                        ),

                    //  MyDropdownButton(options: ,),

                    MyTextField(
                        labelText: "password",
                        obscureText: true,
                        width: 400,
                        color: Colors.green,
                        myController: passwordController,
                        // radius: 20.0,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ));
                      },
                    ),
                  ]),
            ),
          ],
        ),
      ),
    ));
  }
}
