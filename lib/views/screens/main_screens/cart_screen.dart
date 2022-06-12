import 'package:ecommerce_app/widgets/cart_empty.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          CartEmpty(),
        ],
      ),
    );
  }
}
