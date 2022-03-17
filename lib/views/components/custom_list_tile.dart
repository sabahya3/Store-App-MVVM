
import 'package:flutter/material.dart';
import 'package:story/views/components/custom_text.dart';

class CustomListTile extends StatelessWidget {
   CustomListTile({ Key? key,required this.icon,required this.txt }) : super(key: key);

String txt;
IconData icon;
  @override
  Widget build(BuildContext context) {
    return  ListTile(
                    leading: Icon(icon,color: Colors.black,size: 25,),
                    title: CustomText(
                      fontColor: Colors.black,
                      fontSize: 16,
                      txt: txt,
                      fontWeight: FontWeight.bold),
                  );
  }
}