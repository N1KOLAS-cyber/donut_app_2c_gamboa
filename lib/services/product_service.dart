import 'dart:convert';

import 'package:donut_app_2c_gamboa/models/product.dart' show Product;
import 'package:http/http.dart' as http;

class ProductService {

  static const String baseUrl = "http://localhost:8080/market-app/api";


  static Future<List<Product>> getAllProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }


  static Future<List<Product>> getProductsByCategory(int categoryId) async {
    final response = await http.get(
        Uri.parse('$baseUrl/products/category/$categoryId'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('error al cargar los productos por categoria');
    }
  }



}