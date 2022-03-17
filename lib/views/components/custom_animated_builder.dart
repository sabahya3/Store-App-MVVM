import 'dart:math';

import 'package:flutter/material.dart';

class CustomAnimatedBuilder extends StatelessWidget {
  CustomAnimatedBuilder(
      {Key? key, required this.controller, required this.widget})
      : super(key: key);

  late AnimationController controller;
  late Widget widget;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..rotateZ(-(pi / 30) * controller.value)
            ..scale(1 - (controller.value * 0.3))
            ..translate(controller.value * 255),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(controller.value * 50),
              child: widget),
        );
      },
    );
  }
}
