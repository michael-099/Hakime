import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "a_user_msg.dart";
import "bot_msg.dart";
import "chat_field.dart";
import "data.dart";
import '../dashBoard/TopBar.dart';
import 'package:http/http.dart' as http;

class Chat extends StatelessWidget {
  List<Map<String, dynamic>> dummyChatData = [];
TextEditingController messageController = TextEditingController();
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          // appBar: AppBar(
          //   title: Text("chat", style: TextStyle(color: Colors.white)),
          //   centerTitle: true,
          //   backgroundColor: Colors.blue[200],
          // ),

          body: Column(
            children: [
              TopBar(
                  categories: "HAKIME",
                  iconData: Icons.notifications_active_outlined,
                  number_of_doctors: "fmdk"),
              Expanded(
                child: ListView(
                  children: dummyChatData.map((message) {
                    if (message['sender'] == 'bot') {
                      return BotMsg(message: 'message');
                    } else {
                      return UserMsg(message: 'message');
                    }
                  }).toList(),
                ),
              ),
              ChatField(onPressed: (){},textController:messageController),
            ],
          ),
        ));
  }

  Future<void> setDummyData() async {
    try {
      const String authenticationEndpoint =
          'http://localhost:5072/api/auth/login'; 

      final Map<String, String> headers = {
        'Content-Type': 'application/json',
      
      };

      final response = await http.get(
        Uri.parse(authenticationEndpoint),
        headers: headers,
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
  }
}
