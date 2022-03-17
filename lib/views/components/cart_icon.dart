import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:story/view_model/cart_view_model.dart';

// ignore: must_be_immutable
class CartIcon extends StatelessWidget {
  CartIcon({Key? key, required this.onPress}) : super(key: key);
  Function onPress;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: CircleAvatar(
            radius: 10,
            backgroundColor: Colors.white,
            child: Text(
              context.watch<CartViewModel>().cart.length.toString(),
              style:
                  const TextStyle(color: Colors.red, fontWeight: FontWeight.bold,fontSize: 15),
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              onPress();
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.yellow,
              size: 30,
            )),
      ],
    );
  }
}
