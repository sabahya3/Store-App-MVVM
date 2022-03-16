import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTweenBuilder extends StatelessWidget {
  CustomTweenBuilder(
      {Key? key,
      required this.child,
      required this.curve,
      required this.dx,
      required this.dy})
      : super(key: key);

  Widget child;
  Curve curve;
  double dx;
  double dy;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 1200),
      tween: Tween(begin: 1.0, end: 0.0),
      child: child,
      builder: (context, double value, child) {
        return Transform.translate(
            offset: Offset(value * dx,value* dy), child: child!);
      },
      curve: Curves.easeInOutBack,
    );
  }
}
