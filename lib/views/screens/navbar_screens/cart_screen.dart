import 'package:ecommerce_app/controllers/product_controller.dart';
import 'package:ecommerce_app/models/cart_item.dart';
import 'package:ecommerce_app/provider/cart.dart';
import 'package:ecommerce_app/routes.dart';
import 'package:ecommerce_app/widgets/cart_empty.dart';
import 'package:ecommerce_app/widgets/single_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final ProductController _productController = ProductController();
  final CartProvider _cartProvider = CartProvider();

  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    _isLoading = false;
    super.initState();
  }

  Future<void> placeOrder(
    List<CartItem> cartItems,
  ) async {
    setState(() {
      _isLoading = true;
    });
    await _productController.placeUserOrder(cartItems);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final List<CartItem> cartItems = cartProvider.cartItems.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Cart (${cartProvider.cartCount.toString()})',
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
      ),
      body: cartItems.isEmpty
          ? const CartEmpty()
          : Container(
              margin: const EdgeInsets.only(bottom: 50),
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return SingleCartItem(
                    cartItem: cartItems[index],
                  );
                },
              ),
            ),
      bottomSheet: cartItems.isEmpty
          ? null
          : SizedBox(
              height: 50,
              child: Row(
                children: [
                  Column(
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        '\$${cartProvider.cartTotal.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: _isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () async {
                              await placeOrder(cartItems);
                              cartProvider.clearCart();
                              Navigator.of(context).pushNamed(
                                orderScreen,
                              );
                            },
                            child: const Text("Checkout"),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                            ),
                          ),
                  )
                ],
              ),
            ),
    );
  }
}
