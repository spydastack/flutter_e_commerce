import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:flutter/foundation.dart';

class ProductsProvider with ChangeNotifier {
  final CollectionReference _productsRef =
      FirebaseFirestore.instance.collection(productCollections);

  final List<Product> _products = [];

  Future<void> fetchProducts() async {
    _productsRef.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        _products.add(Product.fromFirebase(doc));
      }
    });
  }

  List<Product> get products {
    return [..._products];
  }

  Product findById(String id) {
    return _products.firstWhere((element) => element.id == id);
  }

  List<Product> findByCategory(String category) {
    return _products.where((element) => element.category == category).toList();
  }
}
