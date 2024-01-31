import "dart:convert";
import "dart:ffi";

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "a_user_msg.dart";
import "bot_msg.dart";
import "chat_field.dart";
import "data.dart";
import '../dashBoard/TopBar.dart';
import 'package:http/http.dart' as http;

class Chat extends StatelessWidget {
  List<Map<String, dynamic>> messages = [];
  late List<Map<String, dynamic>> aiMessage;
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
              ChatField(onPressed: () {}, textController: messageController),
            ],
          ),
        ));
  }

  Future<void> loadMessages() async {
    //TODO: Load from cookies

    String userId = "";
    String token = "";
    try {
      String authenticationEndpoint =
          'http://localhost:5072/api/user/$userId/chat';

      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };

      final response = await http.get(
        Uri.parse(authenticationEndpoint),
        headers: headers,
      );

      Map<String, List<Map<String, dynamic>>> decodedResponse =
          jsonDecode(response.body);

      if (response.statusCode == 200) {
        messages = decodedResponse["messages"]!;
        print('Message loading successful. Found ${messages.length} messages');
      } else {
        print("Error while loading messages");
        print(decodedResponse["errors"] ??
            decodedResponse["error"] ??
            "Unknown error occured $decodedResponse");
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> askAI(String message) async {
    try {
      String userId = "";
      String token = "";
      String authenticationEndpoint =
          'http://localhost:5072/api/user/$userId/chat';

      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      final response = await http.post(
        Uri.parse(authenticationEndpoint),
        headers: headers,
        body: jsonEncode(message),
      );

      Map<String, List<Map<String, dynamic>>> decodedResponse =
          jsonDecode(response.body);

      if (response.statusCode == 200) {
        aiMessage = decodedResponse["response"]!;
        print("Ai response: $aiMessage");
      } else {
        print('Ai response failed');
        print(decodedResponse["errors"] ??
            decodedResponse["error"] ??
            "Unknown error occurred $decodedResponse");
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
