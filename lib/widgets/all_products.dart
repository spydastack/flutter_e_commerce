import 'package:ecommerce_app/provider/products.dart';
import 'package:ecommerce_app/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _productsProvider =
        Provider.of<ProductsProvider>(context, listen: false);
    List<Product> _productsList = _productsProvider.products;

    return Column(
      children: [
        SizedBox(
          height: 230,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ProductItem(
                product: _productsList[index],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 5,
            ),
            itemCount: _productsList.length,
          ),
        )
      ],
    );
  }
}
