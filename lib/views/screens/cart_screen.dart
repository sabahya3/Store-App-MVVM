import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story/view_model/cart_view_model.dart';
import 'package:story/views/components/cart_screen_body.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,(){
      context.read<CartViewModel>().getAllCartItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(appBar: AppBar(backgroundColor: Colors.teal,centerTitle: true,title:const Text('Cart'),),
    body: CartScreenBody(
      height: height,
      width: width,
    ),);
  }
}
