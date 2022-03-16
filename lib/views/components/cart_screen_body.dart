import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:story/models/product.dart';
import 'package:story/view_model/cart_view_model.dart';
import 'package:story/views/components/add_to_cart_card.dart';

// ignore: must_be_immutable
class CartScreenBody extends StatelessWidget {
  CartScreenBody({Key? key, required this.height, required this.width})
      : super(key: key);

  double width;
  double height;
  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(
      builder: (context, value, child) {
        return value.cart.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  double totalVal = value.cart[index].total;
                  Product obj = value.cart[index].product;
                  value.cart[index].count == 1
                      ? totalVal = double.parse(obj.price)
                      : null;
                  return AddToCartCard(
                      count: value.cart[index].count.toString(),
                      decrement: () {
                        context
                            .read<CartViewModel>()
                            .decreaseElement(index, obj);
                      },
                      desc: obj.desc,
                      height: height,
                      image: obj.image,
                      increment: () {
                        context
                            .read<CartViewModel>()
                            .increaseElement(index, obj);
                      },
                      title: obj.title,
                      total: totalVal.toString(),
                      width: width);
                });
      },
    );
  }
}
