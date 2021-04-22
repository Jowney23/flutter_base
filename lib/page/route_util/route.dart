import 'package:flutter/material.dart';
import 'package:flutter_app/page/main_page.dart';
import 'package:flutter_app/page/route_util//fade_route_builder.dart';

class Routes {
  /*static void goAnimationTest(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 1000),
            pageBuilder: (context, animation, secondaryAnimation) {
              var begin = Offset(1.0, 0.0);
              var end = Offset(0.0, 0.0);
              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.ease));
              var offsetAnimation = animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: FirstPage(),
              );
            },),
        (Route<dynamic> route) => true);
  }*/
  static void goFirstPage(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(FadeRouteBuilder(builder: (context){
      return FirstPage();
    }), (Route<dynamic> route) => true);
  }


}
