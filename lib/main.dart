import 'package:flutter/material.dart';
import 'Chat/chat.dart';
import 'Profile/profile.dart';
import 'dashBoard/dashboard.dart';
import 'main/Main.dart';
import 'dashBoard/dashboard.dart';
import 'Login/signUp.dart';
// import 'Sign_in and Sign_up/signup.dart';

void main() {
  //The backend to our project is built using dotnet and can be found here https://github.com/HabeshaCare/BackendServer
  runApp(
    //Uncomment the following to view what the pages look like separately. And comment out the MaterialApp(home: SignUp()), part
    // MaterialApp(home: Main())

    //Make sure the dotnet server is running on localhost:5072 before running the app using this code. Or comment this part and follow the above UIs.
    MaterialApp(home: SignUp()),
  );
}
