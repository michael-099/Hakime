import 'package:flutter/material.dart';
import 'edit.dart';

class ProfileCard extends StatelessWidget {
  final String content;
  final String subcontent;
  final IconData frontIcon;

  ProfileCard({
    required this.content,
    required this.subcontent,
    required this.frontIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(content),
        subtitle: Text(subcontent),
        leading: Icon(frontIcon),
        trailing: InkWell(
          child: Icon(Icons.mode_edit_sharp),
          onTap: () {
            print('Icon tapped!');
           Navigator.of(context).push(HeroDialogRoute(builder: (context) {
                return Edit();
              }));
          },
        ),
        tileColor: Colors.white,
      ),
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
