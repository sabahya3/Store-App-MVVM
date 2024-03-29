// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  DefaultFormField({
    Key? key,
    required this.controller,
    required this.validator,
    required this.type,
    required this.icon,
    this.suffixPress,
    this.isPassword = false,
    this.suffix,
    this.maxLine = 1,
  }) : super(key: key);
  TextInputType type;
  TextEditingController controller;
  IconData icon;
  IconData? suffix;
  Function? suffixPress;
  FormFieldValidator validator;
  bool isPassword;
  int maxLine;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine,
      validator: validator,
      obscureText: isPassword,
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide:const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.lightBlue),
            borderRadius: BorderRadius.circular(10)),
        prefixIcon: Icon(
          icon,
          color: Colors.blue,
        ),
        suffixIcon: IconButton(
            onPressed: () {
              suffixPress!();
            },
            icon: Icon(
              suffix,
              color:  Colors.blue,
            )),
        fillColor: Colors.blue[50],
        filled: true,
      ),
    );
  }
}
