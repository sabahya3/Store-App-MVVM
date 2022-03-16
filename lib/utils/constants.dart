import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:story/views/screens/cart_screen.dart';
import 'package:story/views/screens/home_screen.dart';

String url = 'https://my-apis1.herokuapp.com/products';

Radius customRaduis = const Radius.circular(80);
List<Widget> pages = [const MyHomePage(), const CartScreen()];

depugPrint(var obj) {
  if (kDebugMode) {
    print(obj);
  }
}
