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
import "../utils/session.dart";

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
    String userId = Session.state["userId"]!;
    try {
      String messagesEndpoint = 'http://localhost:5072/api/user/$userId/chat';

      final response = await Session.get(messagesEndpoint);
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
      String userId = Session.state["userId"]!;
      String chattingEndpoint = 'http://localhost:5072/api/user/$userId/chat';

      final response = await Session.post(chattingEndpoint, message);

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
