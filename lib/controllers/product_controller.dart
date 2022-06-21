import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/product.dart';

class ProductController {
  final CollectionReference _products =
      FirebaseFirestore.instance.collection('products');
}
