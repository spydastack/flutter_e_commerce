import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/models/order_item_model.dart';
import 'package:flutter/foundation.dart';

class OrderProvider with ChangeNotifier {
  final CollectionReference _productsRef =
      FirebaseFirestore.instance.collection(orderCollections);

  final List<OrderItemModel> _orders = [];

  Future<void> fetchOrders() async {
    _productsRef.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        _orders.add(OrderItemModel.fromFirebase(doc));
      }
    });
  }

  List<OrderItemModel> get orders {
    return [..._orders];
  }
}
