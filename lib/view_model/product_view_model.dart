import 'package:flutter/cupertino.dart';
import 'package:story/models/product.dart';
import 'package:story/reposetry/product_repo.dart';

class ProductViewModel extends ChangeNotifier {
  late ProductRepo productRepo;
  ProductViewModel({required this.productRepo});

 final List<Product> _products = [];

  List<Product> get products {
    return _products;
  }

  Future<void> getProductsFromRepo() async {
   if(_products.isEmpty){
      List? list = await productRepo.getAllProducts();

    _products.addAll(list!.map((e) => Product.fromJson(e)).toList());
    notifyListeners();
   }
  }

  Future<void> addProduct(Product product) async {
    await productRepo.addProduct(product);
   refresh();
  }
  Future<void> removeProduct(String id) async {
    await productRepo.deleteProduct(id);
   refresh();
  }

  refresh(){
  _products.clear();
  getProductsFromRepo();
}
}


