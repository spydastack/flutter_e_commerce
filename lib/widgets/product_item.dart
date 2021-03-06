import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:ecommerce_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _product = Provider.of<Product>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          details,
          arguments: _product.id,
        );
      },
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: 170,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(_product.imageUrl),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 20,
                  child: Badge(
                    toAnimate: true,
                    shape: BadgeShape.square,
                    badgeColor: Colors.black45,
                    borderRadius: BorderRadius.circular(8),
                    badgeContent: const Text(
                      "New Arrivals",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  _product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '\$${_product.price.toString()}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
