import 'package:ecommerce_app/models/cart_item.dart';
import 'package:flutter/material.dart';

class OrderItemModel with ChangeNotifier {
  final String orderId;
  final String productId;
  final String name;
  final String imageUrl;
  final int quantity;
  final String userId;
  final DateTime orderDate;
  final double price;

  OrderItemModel({
    required this.orderId,
    required this.productId,
    required this.name,
    required this.imageUrl,
    required this.quantity,
    required this.userId,
    required this.orderDate,
    required this.price,
  });

  factory OrderItemModel.fromFirebase(doc) {
    return OrderItemModel(
      orderId: doc.id,
      productId: doc.data()['productId'] as String,
      name: doc.data()['name'] as String,
      imageUrl: doc.data()['imageUrl'] as String,
      quantity: doc.data()['quantity'] as int,
      userId: doc.data()['userId'] as String,
      orderDate: doc.data()['orderDate'] as DateTime,
      price: doc.data()['price'] as double,
    );
  }
}
