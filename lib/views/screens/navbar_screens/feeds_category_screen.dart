import 'package:ecommerce_app/provider/products.dart';
import 'package:ecommerce_app/widgets/feeds_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';

class CategoryFeedScreen extends StatefulWidget {
  const CategoryFeedScreen({Key? key}) : super(key: key);

  @override
  State<CategoryFeedScreen> createState() => _CategoryFeedScreenState();
}

class _CategoryFeedScreenState extends State<CategoryFeedScreen> {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as String;
    final productsProvider =
        Provider.of<ProductsProvider>(context, listen: false);
    List<Product> productsList = productsProvider.findByCategory(category);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$category category',
          style: const TextStyle(
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
