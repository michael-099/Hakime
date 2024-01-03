import "package:flutter/material.dart";

class Main extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: "home"),
            NavigationDestination(icon: Icon(Icons.person), label: "message"),
            NavigationDestination(icon: Icon(Icons.person), label: "schedule"),
            NavigationDestination(
                icon: Icon(Icons.person), label: "notification"),
            NavigationDestination(icon: Icon(Icons.person), label: "profile"),
          ],
          onDestinationSelected: (int index) {
            setState(() {
              CurrentPage = index;
            });
          },
          selectedIndex: CurrentPage,
        ),
        NavigationRail(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: "home"),
            NavigationDestination(icon: Icon(Icons.message), label: "message"),
            NavigationDestination(icon: Icon(Icons.schedule), label: "schedule"),
            NavigationDestination(icon: Icon(Icons.notifications), label: "notification"),
            NavigationDestination(icon: Icon(Icons.person), label: "profile"),
          ],
          onDestinationSelected: (int index) {
            setState(() {
              CurrentPage = index;
            });
          },
          selectedIndex: CurrentPage,
        ),
      ),
    );
  }
}
