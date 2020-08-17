import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sevencomic/ui/detail/comic_detail_page.dart';
import 'package:sevencomic/ui/detail/comic_read_page.dart';
import 'package:sevencomic/ui/detail/web_detail_page.dart';
import 'package:sevencomic/ui/main/main_navigator.dart';
import 'package:sevencomic/widget/page_route_anim.dart';

class RouterName {
  static const String main = 'main';
  static const String comicDetail = "comicDetail";
  static const String webDetail = "webDetail";
  static const String read = "comicRead";
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterName.main:
        return NoAnimRouteBuilder(MainNavigator());

      case RouterName.comicDetail:
        return CupertinoPageRoute(builder: (_) => ComicDetailPage(settings.arguments as int));

      case RouterName.webDetail:
        return CupertinoPageRoute(builder: (_) => WebDetailPage(url: settings.arguments as String,));

      case RouterName.read:
        var list = settings.arguments as List;
        return CupertinoPageRoute(builder: (_) => ComicReadPage(comicId: list[0] as String, pos: list[1] as int, chapters: list[2] as List));

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

class ScaleRouter<T> extends PageRouteBuilder<T> {
  final Widget child;
  final int duration_ms;
  final Curve curve;
  ScaleRouter({this.child, this.duration_ms = 500,this.curve=Curves.fastOutSlowIn})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionDuration: Duration(milliseconds: duration_ms),
    transitionsBuilder: (context, a1, a2, child) =>
        ScaleTransition(
          scale: Tween(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(parent: a1, curve: curve)),
          child: child,
        ),
  );
}
//渐变透明路由动画
class FadeRouter<T> extends PageRouteBuilder<T> {
  final Widget child;
  final int duration_ms;
  final Curve curve;
  FadeRouter({this.child, this.duration_ms = 500,this.curve=Curves.fastOutSlowIn})
      : super(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionDuration: Duration(milliseconds: duration_ms),
      transitionsBuilder: (context, a1, a2, child) =>
          FadeTransition(
            opacity: Tween(begin: 0.1, end: 1.0).animate(
                CurvedAnimation(parent: a1, curve:curve,)),
            child: child,
          ));
}

//旋转路由动画
class RotateRouter<T> extends PageRouteBuilder<T> {
  final Widget child;
  final int duration_ms;
  final Curve curve;
  RotateRouter({this.child, this.duration_ms = 500,this.curve=Curves.fastOutSlowIn})
      : super(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionDuration: Duration(milliseconds: duration_ms),
      transitionsBuilder: (context, a1, a2, child) =>
          RotationTransition(
            turns: Tween(begin: 0.1, end: 1.0).animate(
                CurvedAnimation(parent: a1, curve:curve,)),
            child: child,
          ));
}

//右--->左
class Right2LeftRouter<T> extends PageRouteBuilder<T> {
  final Widget child;
  final int duration_ms;
  final Curve curve;
  Right2LeftRouter({this.child,this.duration_ms=500,this.curve=Curves.fastOutSlowIn})
      :super(
      transitionDuration:Duration(milliseconds: duration_ms),
      pageBuilder:(ctx,a1,a2){return child;},
      transitionsBuilder:(ctx,a1,a2,Widget child,) {
        return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0),).animate(
                CurvedAnimation(parent: a1, curve: curve)),
            child:  child
        );
      });
}

//左--->右
class Left2RightRouter<T> extends PageRouteBuilder<T> {
  final Widget child;
  final int duration_ms;
  final Curve curve;
  List<int> mapper;
  Left2RightRouter({this.child,this.duration_ms=500,this.curve=Curves.fastOutSlowIn})
      :assert(true),super(
      transitionDuration:Duration(milliseconds: duration_ms),
      pageBuilder:(ctx,a1,a2){return child;},
      transitionsBuilder:(ctx,a1,a2,Widget child,) {
        return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0),).animate(
                CurvedAnimation(parent: a1, curve: curve)),
            child:  child
        );
      });
}

//上--->下
class Top2BottomRouter<T> extends PageRouteBuilder<T> {
  final Widget child;
  final int duration_ms;
  final Curve curve;
  Top2BottomRouter({this.child,this.duration_ms=500,this.curve=Curves.fastOutSlowIn})
      :super(
      transitionDuration:Duration(milliseconds: duration_ms),
      pageBuilder:(ctx,a1,a2){return child;},
      transitionsBuilder:(ctx,a1,a2,Widget child,) {
        return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0.0,-1.0), end: Offset(0.0, 0.0),).animate(
                CurvedAnimation(parent: a1, curve: curve)),
            child:  child
        );
      });
}

//下--->上
class Bottom2TopRouter<T> extends PageRouteBuilder<T> {
  final Widget child;
  final int duration_ms;
  final Curve curve;
  Bottom2TopRouter({this.child,this.duration_ms=500,this.curve=Curves.fastOutSlowIn})
      :super(
      transitionDuration:Duration(milliseconds: duration_ms),
      pageBuilder:(ctx,a1,a2){return child;},
      transitionsBuilder:(ctx,a1,a2,Widget child,) {
        return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0),).animate(
                CurvedAnimation(parent: a1, curve: curve)),
            child:  child
        );
      });
}

//缩放+透明+旋转路由动画
class ScaleFadeRotateRouter<T> extends PageRouteBuilder<T> {
  final Widget child;
  final int duration_ms;
  final Curve curve;
  ScaleFadeRotateRouter({this.child, this.duration_ms = 500,this.curve=Curves.fastOutSlowIn}) : super(
      transitionDuration: Duration(milliseconds: duration_ms),
      pageBuilder: (ctx, a1, a2)=>child,//页面
      transitionsBuilder: (ctx, a1, a2, Widget child,) {//构建动画
        return RotationTransition(//旋转动画
          turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: a1,
            curve: curve,
          )),
          child: ScaleTransition(//缩放动画
            scale: Tween(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(parent: a1, curve: curve)),
            child: FadeTransition(opacity://透明度动画
            Tween(begin: 0.5, end: 1.0).animate(CurvedAnimation(parent: a1, curve: curve)),
              child: child,),
          ),
        );
      });
}
//无动画
class NoAnimRouter<T> extends PageRouteBuilder<T> {
  final Widget page;
  NoAnimRouter(this.page)
      : super(
      opaque: false,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: Duration(milliseconds: 0),
      transitionsBuilder:
          (context, animation, secondaryAnimation, child) => child);
}
