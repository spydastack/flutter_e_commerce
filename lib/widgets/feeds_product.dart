import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../models/clothes.dart';

class FeedsProduct extends StatefulWidget {
  final Clothes clothe;
  const FeedsProduct({
    Key? key,
    required this.clothe,
  }) : super(key: key);

  @override
  State<FeedsProduct> createState() => _FeedsProductState();
}

class _FeedsProductState extends State<FeedsProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
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
                      image: NetworkImage(widget.clothe.imageUrl),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 20,
                  child: Badge(
                    toAnimate: true,
                    shape: BadgeShape.square,
                    badgeColor: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                    badgeContent: const Text(
                      'new',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Text(
                  widget.clothe.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                Text(
                  widget.clothe.price,
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
