import 'package:ecommerce_app/widgets/all_products.dart';
import 'package:ecommerce_app/widgets/category.dart';
import 'package:ecommerce_app/widgets/category_list.dart';
import 'package:ecommerce_app/widgets/search_input.dart';
import 'package:ecommerce_app/widgets/tag_list.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CustomAppBar(),
              SizedBox(height: 20),
              SearchInput(),
              SizedBox(height: 20),
              TagList(),
              SizedBox(height: 20),
              Category(),
              CategoryList(),
              SizedBox(height: 20),
              AllProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
