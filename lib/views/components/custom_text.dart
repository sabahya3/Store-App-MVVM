import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {Key? key,
      required this.fontColor,
      required this.fontSize,
      required this.txt,
      required this.fontWeight})
      : super(key: key);

  String txt;
  double fontSize;
  Color fontColor;
  FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
          fontSize: fontSize, color: fontColor, fontWeight: fontWeight),
          
    );
  }
}
