import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:story/views/screens/cart_screen.dart';
import 'package:story/views/screens/home_screen.dart';

String url = 'https://my-apis1.herokuapp.com/products';

Radius customRaduis = const Radius.circular(80);
List<Widget> pages = [const MyHomePage(), const CartScreen()];
List<Widget> pageTitle = [const Text('Home'),const Text('Cart'),];

depugPrint(var obj) {
  if (kDebugMode) {
    print(obj);
  }
}

 void modalBottomSheetMenu(BuildContext context,Widget child){
        showModalBottomSheet(
            context: context,
            builder: (builder){
              return  Container(
                height: MediaQuery.of(context).size.height-50,
                color: Colors.transparent, //could change this to Color(0xFF737373), 
                           //so you don't have to change MaterialApp canvasColor
                child:  child
              );
            }
        );
      }