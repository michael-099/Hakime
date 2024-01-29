import "package:flutter/material.dart";
import 'details.dart';

class SmallerCard extends StatelessWidget {
  final String name ;
  final String specialization;
  SmallerCard({required this.name, required this.specialization});

  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: EdgeInsets.all(7.0),
        width: 350,
        height: 70,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: const Border()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('img/Doc.jpeg'),
                    radius: 25,
                  ),
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff2E4450).withOpacity(0.80),
                            decoration: TextDecoration.none),
                      ),

                      // alignment: AlignmentGeometry alignment = Alignment.topLeft,
                      Text(
                       specialization ,
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w200,
                            color: Colors.grey[500],
                            decoration: TextDecoration.none),
                        textAlign: TextAlign.left,
                      ),
                    ]),
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(HeroDialogRoute(builder: (context) {
          return Details();
        }));
      },
    );
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
