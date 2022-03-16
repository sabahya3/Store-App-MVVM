import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:story/view_model/cart_view_model.dart';

class CartIcon extends StatelessWidget {
  CartIcon({Key? key, required this.onPress}) : super(key: key);
  Function onPress;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Text(
            context.watch<CartViewModel>().cart.length.toString(),
            style:
                const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18),
          ),
        ),
        IconButton(
            onPressed: () {
              onPress();
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            )),
      ],
    );
  }
}
