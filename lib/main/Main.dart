import 'package:flutter/material.dart';
import '../Chat/chat.dart';
import '../Login/Log_in.dart';
// import '../Profile/profile.dart';
import '../Profile 2/profile.dart';
import '../dashBoard/dashboard.dart';
import '../Notification/Notification.dart';
import '../schedule/schedule.dart';
import "package:curved_navigation_bar/curved_navigation_bar.dart";

class Main extends StatefulWidget {
  State createState() => NavpageState();
}

class NavpageState extends State<Main> {
  int currentPage = 0;
  List<Widget> pages = [DashBoard(), Chat(), Schedules(), Profile()];

  @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: Scaffold(
  //       body: pages[currentPage],
  //       bottomNavigationBar: NavigationBar(
  //         // backgroundColor: Colors.white,
  //         // indicatorColor: Colors.white,
  //         // surfaceTintColor: Color.fromARGB(255, 92, 180, 215).withOpacity(1),
  //         onDestinationSelected: (index) {
  //           setState(() {
  //             currentPage = index;
  //           });
  //         },
  //         selectedIndex: currentPage,
  //         // ignore: prefer_const_literals_to_create_immutables
  //         destinations: [

  //           const NavigationDestination(icon: Icon(Icons.home), label: "home"),
  //           const NavigationDestination(
  //               icon: Icon(Icons.message), label: "message"),
  //           const NavigationDestination(
  //               icon: Icon(Icons.schedule), label: "schedule"),
  //           const NavigationDestination(
  //               icon: Icon(Icons.person), label: "profile"),
  //         ],
  //       ),
  //     ),
  //   );
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: pages[currentPage],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: const Color.fromARGB(255, 234, 232, 232),
          buttonBackgroundColor: const Color.fromARGB(255, 234, 232, 232),
          height: 60,
          onTap: (index) {
            setState(() {
              currentPage = index;
            });
          },
          index: currentPage,
          items: [
            Icon(Icons.home_outlined, size: 30),
            Icon(Icons.message_outlined, size: 30),
            Icon(Icons.schedule, size: 30),
            Icon(Icons.person_3_outlined, size: 30),
          ],
          // Add shadow to the navigation bar
          // elevation: 5.0,
        ),
      ),
    );
  }
}
