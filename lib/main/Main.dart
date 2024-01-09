import 'package:flutter/material.dart';
import '../Chat/chat.dart';
import '../Login/Log_in.dart';
import '../Profile/profile.dart';
import '../dashBoard/dashboard.dart';

class Main extends StatefulWidget {
  State createState() => NavpageState();
}

class NavpageState extends State<Main> {
  int currentPage = 0;
  List<Widget> pages = [DashBoard(), Login(), Chat(), Chat(), Profile()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: pages[currentPage],
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (index) {
            setState(() {
              currentPage = index;
            });
          },
          selectedIndex: currentPage,
          
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: "home"),
            NavigationDestination(icon: Icon(Icons.message), label: "message"),
            NavigationDestination(
                icon: Icon(Icons.schedule), label: "schedule"),
            NavigationDestination(
                icon: Icon(Icons.notifications), label: "notification"),
            NavigationDestination(icon: Icon(Icons.person), label: "profile"),
          ],
        ),
      ),
    );
  }
}
// import "package:flutter/material.dart";
// import '../Chat/chat.dart';
// import '../Login/Log_in.dart';
// import '../Profile/profile.dart';
// import '../dashBoard/dashboard.dart';
// import '../main/Main.dart';

// class Main extends StatefulWidget {
//   State createState() => NavpageState();
// }

// class NavpageState extends State<Main> {
//   int currentIndex = 0;
//   List<Widget> pages = [DashBoard(),Login(),Chat(), Chat(), Profile()];

//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: pages[currentIndex],
//         bottomNavigationBar: NavigationBar(
//            onItemTapped: (index) {
//           setState(() {
//             currentIndex = index;
//           });
          

//           // Navigate to the selected page using Navigator
//           switch (index) {
//             case 0:
//               Navigator.push(context, MaterialPageRoute(builder: (context) =>DashBoard() ));
//               break;
//             case 1:
//               Navigator.push(context, MaterialPageRoute(builder: (context) =>Login()));
//               break;
//             case 2:
//               Navigator.push(context, MaterialPageRoute(builder: (context) => Chat()));
//               break;
//              case 3:
//               Navigator.push(context, MaterialPageRoute(builder: (context) => Chat()));
//               break;
//              case 4:
//               Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
//               break;
//           }
        

//           destinations: [
//             NavigationDestination(icon: Icon(Icons.home), label: "home"),
//             NavigationDestination(icon: Icon(Icons.message), label: "message"),
//             NavigationDestination(
//                 icon: Icon(Icons.schedule), label: "schedule"),
//             NavigationDestination(
//                 icon: Icon(Icons.notifications), label: "notification"),
//             NavigationDestination(icon: Icon(Icons.person), label: "profile"),
//           ],

          
//         ),
//       ),
//     );
//   }
// }
