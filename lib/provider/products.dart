import 'package:ecommerce_app/models/product.dart';
import 'package:flutter/foundation.dart';

class ProductsProvider with ChangeNotifier {
  final List<Product> _products = Product.generateProducts();

  List<Product> get products {
    return [..._products];
  }

  Product findById(String id) {
    return _products.firstWhere((element) => element.id == id);
  }
}
