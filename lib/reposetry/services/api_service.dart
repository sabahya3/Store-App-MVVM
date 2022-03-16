import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:story/models/product.dart';
import 'package:story/reposetry/product_repo.dart';
import 'package:http/http.dart' as http;
import 'package:story/utils/constants.dart';

class Api extends ProductRepo {
  @override
  Future<void> addProduct(Product product) async {
    http.Response response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(product.toJson()));

    print(response.body);
  }

  @override
  Future<void> deleteProduct(String id) async {
    http.Response response = await http.delete(Uri.parse(url + '/' + id));
    if (kDebugMode) {
      print(response.body);
    }
  }

  @override
  Future<void> updateProduct(String id, Product product) async {
    http.Response response = await http.patch(Uri.parse(url + '/' + id),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(product.toJson()));

    if (kDebugMode) {
      print(response);
    }
  }

  @override
  Future<List>? getAllProducts() async {
    List? body;
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        body = jsonDecode(response.body);
        if (kDebugMode) {
          print(body);
        }
      }

    } catch (e) {}
          return body!;
  }
}
