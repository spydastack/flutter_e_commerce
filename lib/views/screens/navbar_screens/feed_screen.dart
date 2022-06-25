import 'package:ecommerce_app/provider/products.dart';
import 'package:ecommerce_app/widgets/feeds_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    final productsProvider =
        Provider.of<ProductsProvider>(context, listen: true);
    List<Product> productsList = productsProvider.products;
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
          productsList.length,
          (index) => ChangeNotifierProvider.value(
            value: productsList[index],
            child: const FeedsProduct(),
          ),
        ),
      ),
    );
  }
}
