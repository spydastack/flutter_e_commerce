import 'package:ecommerce_app/widgets/feeds_product.dart';
import 'package:flutter/material.dart';

import '../../../models/clothes.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

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
          10,
          (index) => FeedsProduct(
            clothe: Clothes(
              id: "1",
              name: "T-Shirt",
              category: "T-Shirt",
              price: "30",
              imageUrl:
                  "https://cdn.pixabay.com/photo/2017/05/23/10/53/t-shirt-design-2336850_960_720.jpg",
            ),
          ),
        ),
      ),
    );
  }
}
