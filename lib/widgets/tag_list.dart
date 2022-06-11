import 'package:flutter/material.dart';

class TagList extends StatelessWidget {
  const TagList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> tagList = ["Women", "T-shirt", "Dress", "Shoes"];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: tagList
          .map(
            (tag) => TextButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text(
                tag,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          )
          .toList(),
    );
  }
}
