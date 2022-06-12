import 'package:ecommerce_app/widgets/feeds_product.dart';
import 'package:flutter/material.dart';

import '../../../models/product.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final List<Product> product = Product.generateClothes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Feeds products',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        childAspectRatio: 200 / 270,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        crossAxisCount: 2,
        children: List.generate(
          product.length,
          (index) => FeedsProduct(
            product: Product(
              id: product[index].id,
              name: product[index].name,
              price: product[index].price,
              imageUrl: product[index].imageUrl,
              quantity: product[index].quantity,
              description: product[index].description,
              category: product[index].category,
            ),
          ),
        ),
      ),
    );
  }
}
