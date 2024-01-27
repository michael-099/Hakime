import "dart:js";

import "package:flutter/material.dart";
import "paymentInfo.dart";
import 'dart:ui';

class Ad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0),
            // border: Border.all(
            //   color: Colors.black, // Set border color as needed
            //   width: 2.0, // Set border width as needed
            // ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              'img/Doc.jpeg',
              width: 350.0,
              height: 170.0,
              fit: BoxFit.cover, // Adjust the BoxFit as needed
            ),
          ),
        ),
        Positioned(
            top: 90.0,
            left: 40.0,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(HeroDialogRoute(builder: (context) {
                  return Pay();
                }));
              },
              child: Text(
                '     Subscribe     ',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.lightBlue.shade200, // Replace with your desired color
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Replace with your desired border radius
                  ),
                ),
              ),
            )),
      ],
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
