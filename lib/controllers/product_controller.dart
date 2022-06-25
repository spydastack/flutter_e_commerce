import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/models/cart_item.dart';
import 'package:ecommerce_app/provider/cart.dart';

class ProductController {
  final _fireStore = FirebaseFirestore.instance;
  final AuthController _authController = AuthController();

  Future<void> placeUserOrder(_cartItems) async {
    try {
      for (var element in _cartItems) {
        // for each cart item
        await _fireStore.collection(orderCollections).add({
          'productId': element.productId,
          'name': element.name,
          'imageUrl': element.imageUrl,
          'quantity': element.quantity,
          'price': element.price * element.quantity,
          'userId': _authController.getCurrentUser()?.uid,
          'orderDate': DateTime.now(),
        });
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
