import 'package:ecommerce_app/models/order_item_model.dart';
import 'package:ecommerce_app/widgets/order_item.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return OrderItem(
            orderItemModel: OrderItemModel(
              imageUrl:
                  'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
              productId: 'p1',
              price: 20,
              name: 'T-shirt',
              quantity: 1,
              orderId: 'o1',
              orderDate: DateTime.now(),
              userId: 'u1',
            ),
          );
        },
      ),
    );
  }
}
