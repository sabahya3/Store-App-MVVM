import 'package:story/models/product.dart';

class Cart {
  late int count;
  late Product product;
  late double total;

  Cart({required this.product, required this.count, this.total = 0});

  factory Cart.fromJson(Map<dynamic, dynamic> json) {
    return Cart(
        product: Product.fromJson(json['product']),
        count: json['count'],
        total: json['total']);
  }

  Map<String, dynamic> toJson() {
    return {'count': count, 'product': product.toJson(), 'total': total};
  }
}
