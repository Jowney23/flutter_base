import 'package:flutter/material.dart';

class SlideRouteBuilder extends PageRoute {
  SlideRouteBuilder({
    @required this.builder,
    this.transitionDuration = const Duration(milliseconds: 200),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
  });

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) => builder(context);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if(isActive) {
      var begin = Offset(1.0, 0.0);
      var end = Offset(0.0, 0.0);
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.ease));
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: builder(context),
      );
    }else{
      //返回，则不应用过渡动画
      return Padding(padding: EdgeInsets.zero);
    }
  }
}