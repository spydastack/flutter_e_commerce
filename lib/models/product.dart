import 'package:flutter/foundation.dart';

import '../dummy_data/dummy_data.dart';

class Product with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final String category;
  final int quantity;
  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.category,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      price: json['price'].toDouble(),
      category: json['category'] as String,
      quantity: json['quantity'] as int,
    );
  }

  static List<Product> generateProducts() {
    return dummyProductData
        .map(
          (e) => Product.fromJson(e),
        )
        .toList();
  }
}
