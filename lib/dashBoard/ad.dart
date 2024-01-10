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
          top: 100.0,
          left: 70.0,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(HeroDialogRoute(builder: (context) {
                return Pay();
              }));
            },
            child: Text('premium'),
          ),
        ),
      ],
    );
  }
  //  Future<void> openPay(BuildContext context) async {
  //   await showDialog(
  //     context: context,
  //     builder: (context) =>AlertDialog() ,
  //   );
  // }
}

/// {@template hero_dialog_route}
/// Custom [PageRoute] that creates an overlay dialog (popup effect).
///
/// Best used with a [Hero] animation.
/// {@endtemplate}
class HeroDialogRoute<T> extends PageRoute<T> {
  /// {@macro hero_dialog_route}
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
