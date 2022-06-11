import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:ecommerce_app/routes.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/models/clothes.dart';

class ProductItem extends StatelessWidget {
  final Clothes clothe;
  const ProductItem({
    Key? key,
    required this.clothe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          details,
          arguments: clothe,
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
                      image: NetworkImage(clothe.imageUrl),
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
                  clothe.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                Text(
                  clothe.price,
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
