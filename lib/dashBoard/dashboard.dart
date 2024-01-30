import "package:flutter/material.dart";
import "ad.dart";
import "card.dart";
import "search.dart";
import 'paymentInfo.dart';
import "smallerCard.dart";
import 'TopBar.dart';
import "Text.dart";
import 'docData.dart';
import 'details.dart';

class DashBoard extends StatelessWidget {
  Widget build(BuildContext context) {
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
                texts: "recomandiations",
              ),
              Column(
                children: dataitems.map((item) {
                  return GestureDetector(
                    child: SmallerCard(
                      name: item.name,
                      specialization: item.specialization,
                      img:item.image,
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .push(HeroDialogRoute(builder: (context) {
                        return Details(name: item.name,specialization: item.specialization,expriance: item.experience,city: item.city,country: item.country,imgs:item.image,pno:item.pno);
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
