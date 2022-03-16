import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:story/models/product.dart';
import 'package:story/view_model/cart_view_model.dart';
import 'package:story/views/components/cart_icon.dart';
import 'package:story/views/components/detail_screen_body.dart';

class Details extends StatefulWidget {
  Details({Key? key, required this.product}) : super(key: key);

  Product product;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  void initState() {
    super.initState();
   Future.delayed(Duration.zero,(){
        context.read<CartViewModel>().getAllCartItems();
   });

  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          title: Text(widget.product.title),
          backgroundColor: Colors.teal,
          actions: [
            CartIcon(onPress: () {
              context.read<CartViewModel>().addToCart(widget.product);
            })
          ]),
      body: DetailsBody(height: height, product: widget.product, width: width),
    );
  }
}
