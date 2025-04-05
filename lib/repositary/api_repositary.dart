import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/model_class.dart';

class ProductRepo {
  final String url = "https://dummyjson.com/products";

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> productJson = json.decode(response.body)['products'];
      return productJson.map((json) => Product.fromJson(json)).toList();
    }else {
      throw Exception('Failed to load products');
    }
  }
}
