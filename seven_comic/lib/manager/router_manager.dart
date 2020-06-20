import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sevencomic/ui/main/main_navigator.dart';
import 'package:sevencomic/widget/page_route_anim.dart';

class RouterName {
  static const String main = 'main';
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterName.main:
        return NoAnimRouteBuilder(MainNavigator());

      default:
        return CupertinoPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text("no route defined for ${settings.name}"),
              ),
            )
        );
    }
  }
}

class PopRoute extends PopupRoute {
  final Duration _duration = Duration(milliseconds: 300);
  Widget child;

  PopRoute({@required this.child});

  @override
  Color get barrierColor {
    return null;
  }

  @override
  bool get barrierDismissible {
    return true;
  }

  @override
  String get barrierLabel {
    return null;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration {
    return _duration;
  }
}