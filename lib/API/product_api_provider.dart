import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class ProductApiProvider {
  Future<List<Product>> fetchProducts() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:3000/products'));

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((item) => Product.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load products from API');
      }
    } catch (e) {
      print('Failed to fetch products: $e');
      return []; // Return an empty list when there's an exception
    }
  }
}
