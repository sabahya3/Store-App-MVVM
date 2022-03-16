import 'package:flutter/cupertino.dart';
import 'package:story/models/cart.dart';
import 'package:story/models/product.dart';
import 'package:story/reposetry/services/hive_service.dart';

class CartViewModel with ChangeNotifier {
 final List<Cart> _cart = [];

  List<Cart> get cart {
    return _cart;
  }

  void getAllCartItems() {
    if (_cart.isEmpty) {
      List? items = AddToCart.instance.getAllProducts();
      _cart.addAll(items!.map((item) => Cart.fromJson(item)).toList());

      notifyListeners();
    }
  }
  //

  void increaseElement(int index, Product product) {
    int count = _cart[index].count;
    double total =
        count == 1 ? double.parse(product.price) : _cart[index].total;
    count++;
    total = total + double.parse(product.price);
    AddToCart.instance.updateCartItem(index, product, count, total);
    refresh();
  }

  void decreaseElement(int index, Product product) {
    int count = _cart[index].count;

    double total =
        count == 1 ? double.parse(product.price) : _cart[index].total;
    count--;
    if (count == 0) {
      AddToCart.instance.deleteElement(index);
    } else {
      total = total - double.parse(product.price);
      AddToCart.instance.updateCartItem(index, product, count, total);
    }

    refresh();
  }

  void addToCart(Product product) {
    
    AddToCart.instance.addToCart(product);
    refresh();
  }

  void refresh() {
    _cart.clear();
    getAllCartItems();
  }
}
