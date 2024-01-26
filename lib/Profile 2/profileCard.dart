import 'package:flutter/material.dart';
import 'edit.dart';

class ProfileCard extends StatefulWidget {
  final String content;
  final String subcontent;
  final IconData frontIcon;

  ProfileCard({
    required this.content,
    required this.subcontent,
    required this.frontIcon,
  });

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.content),
        subtitle: Text(widget.subcontent),
        leading: Icon(widget.frontIcon),
        trailing: InkWell(
          child: Icon(Icons.mode_edit_sharp),
          onTap: () {
            print('Icon tapped!');
           Navigator.of(context).push(HeroDialogRoute(builder: (context) {
           
                return Edit();
              }));
               setState(() {
              
            });
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
