import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "a_user_msg.dart";
import "bot_msg.dart";
import "chat_field.dart";
import "data.dart";
import '../dashBoard/TopBar.dart';

class Chat extends StatelessWidget {
  Widget build(BuildContext context) {
    const List<Map<String, dynamic>> dummyChatData = [
      {
        'sender': 'user',
        'message': 'Hey there!',
        'timestamp': '2023-01-01T12:34:56',
      },
      {
        'sender': 'bot',
        'message': 'Hi user! How can I assist you today?',
        'timestamp': '2023-01-01T12:36:15',
      },
      {
        'sender': 'user',
        'message': 'I have a question about Flutter.',
        'timestamp': '2023-01-01T12:37:42',
      },
      {
        'sender': 'bot',
        'message': 'Sure, go ahead and ask. Im here to help!',
        'timestamp': '2023-01-01T12:39:18',
      },
      {
        'sender': 'user',
        'message': 'How do I use ListView.builder in Flutter?',
        'timestamp': '2023-01-01T12:41:05',
      },
      {
        'sender': 'bot',
        'message':
            'ListView.builder is great for efficiently creating lists in Flutter. You provide a builder function that creates widgets on-demand as they are scrolled into view.',
        'timestamp': '2023-01-01T12:43:20',
      },
    ];

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
              ChatField(),
            ],
          ),
        ));
  }
}
