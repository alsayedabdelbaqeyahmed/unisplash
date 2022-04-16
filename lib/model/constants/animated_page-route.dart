import 'package:flutter/material.dart';

class AnimatedPageRoute extends PageRouteBuilder {
  final Widget widget;
  final double beginDx;
  final double beginDy;
  final double endDx;
  final double endDy;
  final Curve curve;
  final Duration duration;
  AnimatedPageRoute({
    required this.widget,
    required this.beginDx,
    required this.beginDy,
    required this.endDx,
    required this.endDy,
    required this.curve,
    required this.duration,
  }) : super(
          transitionDuration: duration,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final begin = Offset(beginDx, beginDy);
            final end = Offset(endDx, endDy);

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          pageBuilder: (context, animation, secondaryAnimation) => widget,
        );
}
