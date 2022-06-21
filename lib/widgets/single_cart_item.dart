import 'package:ecommerce_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ecommerce_app/models/cart_item.dart';
import 'package:ecommerce_app/provider/cart.dart';

class SingleCartItem extends StatelessWidget {
  final CartItem cartItem;
  const SingleCartItem({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(details, arguments: cartItem.productId);
      },
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(10),
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          cartItem.imageUrl,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartItem.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Price: \$${cartItem.price} x ${cartItem.quantity}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Sub: \$${(cartItem.quantity * cartItem.price).toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              cartProvider.addItem(
                                cartItem.productId,
                                cartItem.name,
                                cartItem.price,
                                cartItem.imageUrl,
                              );
                            },
                            icon: const Icon(
                              Icons.add,
                            ),
                          ),
                          const SizedBox(width: 40),
                          IconButton(
                            onPressed: () {
                              cartProvider.reduceCartItem(cartItem.productId);
                            },
                            icon: const Icon(
                              Icons.remove,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      cartProvider.deleteFromCart(cartItem.productId);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
