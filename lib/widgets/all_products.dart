import 'package:ecommerce_app/widgets/product_item.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Product> product = Product.generateClothes();

    return Column(
      children: [
        SizedBox(
          height: 230,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ProductItem(
                product: product[index],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 5,
            ),
            itemCount: product.length,
          ),
        )
      ],
    );
  }
}
