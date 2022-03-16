import 'package:story/models/product.dart';

abstract class ProductRepo {
  Future<List>? getAllProducts();
  Future<void> addProduct(Product product);
  Future<void> updateProduct(String id,Product product);
  Future<void> deleteProduct(String id);
}
