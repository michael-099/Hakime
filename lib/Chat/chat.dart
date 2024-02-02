import "dart:convert";
import "package:flutter/material.dart";
import "a_user_msg.dart";
import "bot_msg.dart";
import "chat_field.dart";
import '../dashBoard/TopBar.dart';
import "../utils/session.dart";

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<StatefulWidget> createState() {
    return ChatState();
  }
}

class ChatState extends State<Chat> {
/* Here are some examples data for the following variables
      messages =  [
                    {
                      "createdDate": "2024-01-30T21:26:46.605Z",
                      "content": "What are you?",
                      "type": 0,
                      "userId": "65b9679db44315585bdb9302"
                    },
                    {
                      "createdDate": "2024-01-30T21:27:08.339Z",
                      "content": "I am a health assistant for patients, especially on stroke.",
                      "type": 1,
                      "userId": "65b9679db44315585bdb9302"
                    }
                  ]
        "0" - means it is a human message
        "1" - means it is an AI message

      aiMessage = {
                    "createdDate": "2024-01-30T21:28:12.778Z",
                    "content": "What are you?",
                    "type": 0,
                    "userId": "65b9679db44315585bdb9302"
                  }

  */

  List<Map<String, dynamic>> messages = [];
  Map<String, dynamic> aiMessage = {};
  TextEditingController messageController = TextEditingController();

  @override
  initState() {
    super.initState();
    loadMessages();
  }

  Future<void> loadMessages() async {
    String userId = Session.state["userId"] ?? "None";
    // print("User id : $userId");
    try {
      String messagesEndpoint = 'http://localhost:5072/api/user/$userId/chat';

      final response = await Session.get(messagesEndpoint);
      Map<String, dynamic> decodedResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        setState(() {
          List<Map<String, dynamic>> temp =
              (decodedResponse["messages"] as List)
                  .cast<Map<String, dynamic>>();
          // print(temp);
          messages = temp;
        });
        print('Message loading successful. Found ${messages.length} messages');
      } else {
        print("Error while loading messages");
        print(decodedResponse["errors"] ??
            decodedResponse["error"] ??
            "Unknown error occurred $decodedResponse");
      }
    } catch (error) {
      print('Something went wrong: $error');
      // rethrow;
    }
  }

  Future<void> askAI(String message) async {
    try {
      String userId = Session.state["userId"] ?? "None";
      String chattingEndpoint = 'http://localhost:5072/api/user/$userId/chat';
      print("Asking llm with message: $message");
      final response = await Session.post(chattingEndpoint, message);

      Map<String, dynamic> decodedResponse = jsonDecode(response.body);
      // print(decodedResponse);

      if (response.statusCode == 200) {
        setState(() {
          aiMessage = decodedResponse["response"];
        });
        print("Ai response: $aiMessage");
      } else {
        print('Ai response failed');
        print(decodedResponse["errors"] ??
            decodedResponse["error"] ??
            "Unknown error occurred $decodedResponse");
      }
    } catch (error) {
      print('Error: $error');
      // rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            // Your TopBar widget goes here
            TopBar(
              categories: "HAKIME",
              iconData: Icons.notifications_active_outlined,
              number_of_doctors: "fmdk",
            ),
            Expanded(
              child: ListView(
                children: messages.map((message) {
                  if (message['type'] == 1) //To indicate that it is ai
                  {
                    return BotMsg(message: message['content']);
                  } else {
                    return UserMsg(message: message['content']);
                  }
                }).toList(),
              ),
            ),
            // Your ChatField widget goes here
            ChatField(
                onPressed: () async {
                  setState(() {
                    messages.add({
                      'type': 0, // Assuming 0 is used for user messages
                      'content': messageController.text,
                    });
                  });
                  try {
                    await askAI(messageController.text);
                    if (aiMessage != {}) {
                      setState(() {
                        messages.add(aiMessage);
                      });
                    }
                  } catch (error) {
                    print("Error: $error");
                  }
                  messageController.clear();
                },
                textController: messageController),
          ],
        ),
      ),
    );
  }
}
