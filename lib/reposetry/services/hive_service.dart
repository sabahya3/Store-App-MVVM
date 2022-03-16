import 'package:hive_flutter/hive_flutter.dart';
import 'package:story/models/cart.dart';
import 'package:story/models/product.dart';
import 'package:story/utils/constants.dart';

class AddToCart {
  static AddToCart instance = AddToCart();
  addToCart(Product product) {
    Box box = Hive.box('car');
    if (box.values
            .map((e) => Cart.fromJson(e).product.title)
            .contains(product.title) ==
        true) {
      depugPrint('Product already exists');
    } else {
      box.add(Cart(product: product, count: 1).toJson());
    }
  }

  updateCartItem(int index, Product product, int count, double total) {
    Box box = Hive.box('car');

    box.putAt(
        index, Cart(product: product, count: count, total: total).toJson());
  }

  deleteElement(int index) {
    Box box = Hive.box('car');

    box.deleteAt(index);
  }

  List<dynamic>? getAllProducts() {
    Box box = Hive.box('car');

    List<dynamic>? products = [];
    products.addAll(box.values);

    return products;
  }
}
