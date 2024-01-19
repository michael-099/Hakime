import 'package:flutter/material.dart';
// import 'package:namer_app/Sign_in%20and%20Sign_up/signup.dart';
import './signup.dart';
import 'MyTextField.dart';
import 'button.dart';

class SignIn extends StatelessWidget {
  final TextEditingController textController = TextEditingController();
  final TextEditingController textController2 = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sign in",
                style: TextStyle(
                    fontSize: 40,
                    color: Color.fromARGB(255, 117, 116, 114),
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: 20,
              width: 20,
            ),
            MyTextField(
              labelText: "User Name",
              obscureText: false,
              radius: 10,
              width: 500,
            ),
            MyTextField(
              labelText: "password",
              obscureText: true,
              radius: 10,
              width: 500,
            ),
            Button(
                label: "sign in ",
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
                        "forget password? ",
                        style: TextStyle(color: Colors.blue[400]),
                        textAlign: TextAlign.left,
                      ),
                      onPressed: () {},
                    ),
                    TextButton(
                      child: Text(
                        "sign up",
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
