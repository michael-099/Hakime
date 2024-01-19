import 'package:flutter/material.dart';
import '../Chat/chat.dart';
import '../Login/Log_in.dart';
import '../Profile/profile.dart';
import '../dashBoard/dashboard.dart';
import '../Notification/Notification.dart';
import '../schedule/schedule.dart';

class Main extends StatefulWidget {
  State createState() => NavpageState();
}

class NavpageState extends State<Main> {
  int currentPage = 0;
  List<Widget> pages = [
    DashBoard(),
    Chat(),
    Schedules(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: pages[currentPage],
        bottomNavigationBar: NavigationBar(
          // backgroundColor: Colors.white,
          // indicatorColor: Colors.white,
          // surfaceTintColor: Color.fromARGB(255, 92, 180, 215).withOpacity(1),
          onDestinationSelected: (index) {
            setState(() {
              currentPage = index;
            });
          },
          selectedIndex: currentPage,
          // ignore: prefer_const_literals_to_create_immutables
          destinations: [
            const NavigationDestination(icon: Icon(Icons.home), label: "home"),
            const NavigationDestination(
                icon: Icon(Icons.message), label: "message"),
            const NavigationDestination(
                icon: Icon(Icons.schedule), label: "schedule"),
            const NavigationDestination(
                icon: Icon(Icons.person), label: "profile"),
          ],
        ),
      ),
    );
  }
}
