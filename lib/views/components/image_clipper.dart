import 'package:flutter/material.dart';

class NetworkImageClipper extends StatelessWidget {
  NetworkImageClipper(
      {Key? key,
      required this.height,
      required this.width,
      required this.image,
      required this.radius})
      : super(key: key);
  String image;
  double radius;
  double width;
  double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.network(
        image,
        width: width,
        height: height,
        fit: BoxFit.fill,
      ),
    );
  }
}
