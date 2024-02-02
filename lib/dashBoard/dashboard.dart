import "dart:convert";

import "package:flutter/material.dart";
import "../utils/session.dart";
import "ad.dart";
import "card.dart";
import "search.dart";
import 'paymentInfo.dart';
import "smallerCard.dart";
import 'TopBar.dart';
import "Text.dart";
import 'docData.dart';
import 'details.dart';

class DashBoard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DashboardState();
  }
}

class DashboardState extends State<DashBoard> {
  List<Map<String, dynamic>> doctorsData = [];

  @override
  initState() {
    super.initState();
    fetchDoctors();
  }

  Future<void> fetchDoctors() async {
    try {
      String doctorsEndpoint = 'http://localhost:5072/api/doctor';

      final response = await Session.get(doctorsEndpoint);
      Map<String, dynamic> decodedResponse = jsonDecode(response.body);
      print(decodedResponse);
      if (response.statusCode == 200) {
        setState(() {
          List<Map<String, dynamic>> temp =
              (decodedResponse["users"] as List).cast<Map<String, dynamic>>();
          print(temp);
          doctorsData = temp;
        });
        print(
            'Doctors loading successful. Found ${doctorsData.length} doctors');
      } else {
        print("Error while loading doctors");
        print(decodedResponse["errors"] ??
            decodedResponse["error"] ??
            "Unknown error occurred $decodedResponse");
      }
    } catch (error) {
      // print('Something went wrong: $error');
      rethrow;
    }
  }

  Widget build(BuildContext context) {
    int i = 0;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TopBar(
                  categories: "HAKIME",
                  iconData: Icons.notifications_active_outlined,
                  number_of_doctors: "fmdk"),
              const SizedBox(
                height: 10,
              ),
              Search(),
              const SizedBox(
                height: 10,
              ),
              Ad(),
              const SizedBox(
                height: 20,
              ),
              TextW(texts: "catagoreis"),
              Container(
                width: 370,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        child: CatagoryCard(
                          iconData: Icons.heat_pump_rounded,
                          categories: "cardiology",
                          number_of_doctors: "10",
                          image: "img/cardiology.png",
                        ),
                      ),
                      Container(
                        child: CatagoryCard(
                          iconData: Icons.heat_pump,
                          categories: "Dermatology",
                          number_of_doctors: "10",
                          image: "img/dermatologically-tested.png",
                        ),
                      ),
                      Container(
                        child: CatagoryCard(
                          iconData: Icons.heat_pump,
                          categories: "Immunology",
                          number_of_doctors: "10",
                          image: "img/immune-system (1).png",
                        ),
                      ),
                      Container(
                        child: CatagoryCard(
                          iconData: Icons.heat_pump,
                          categories: "Pathology",
                          number_of_doctors: "10",
                          image: "img/microscope.png",
                        ),
                      ),
                      Container(
                        child: CatagoryCard(
                          iconData: Icons.heat_pump,
                          categories: "neurology",
                          number_of_doctors: "10",
                          image: "img/neurology.png",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextW(
                texts: "Recommendations",
              ),
              Column(
                children: doctorsData.map((item) {
                  i += 1;
                  if (i > 6) i = 0;
                  print("Phone number: ${item["phonenumber"]}");
                  return GestureDetector(
                    child: SmallerCard(
                      name: item["fullname"],
                      specialization: item["specialization"],
                      img: "img/img($i).jpeg",
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .push(HeroDialogRoute(builder: (context) {
                        return Details(
                            name: item["fullname"],
                            specialization: item["specialization"],
                            expriance: item["yearOfExperience"].toString(),
                            city: item["city"],
                            imgs: "img/img($i).jpeg",
                            pno: "Phone number");
                      }));
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ));
  }
}

class HeroDialogRoute<T> extends PageRoute<T> {
  HeroDialogRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool fullscreenDialog = false,
  })  : _builder = builder,
        super(settings: settings, fullscreenDialog: fullscreenDialog);

  final WidgetBuilder _builder;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => Colors.black54;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return _builder(context);
  }

  @override
  String get barrierLabel => 'Popup dialog open';
}
