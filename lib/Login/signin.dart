import 'package:flutter/material.dart';
// import 'package:namer_app/Sign_in%20and%20Sign_up/signup.dart';
import 'signup.dart';
import 'MyTextField.dart';
import 'button.dart';
import 'dropdown.dart';
import 'discription.dart';
import 'package:http/http.dart' as http;

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
                    GestureDetector(
                        // ignore: prefer_const_constructors
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
                            String pno = pnoController.text;
                            String pass = passwordController.text;
                            print(email);
                            print(pno);
                            print(pass);

                            final String authenticationEndpoint =
                                'http://localhost:5072/api/auth/login';

                            try {
                              final response = await http.post(
                                Uri.parse(authenticationEndpoint),
                              );

                              if (response.statusCode == 200) {
                                print('Authentication successful');

                                print('Response Body: ${response.body}');
                              } else {
                                print('Authentication failed');
                              }
                            } catch (error) {
                              print('Error: $error');
                            }
                          }  authenticateUser();
                        }),

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
