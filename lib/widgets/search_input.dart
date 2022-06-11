import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search products',
                hintStyle: const TextStyle(
                  color: Colors.black54,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Image(
                    image: AssetImage("assets/icons/search-icon-50.png"),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Icon(
                Icons.filter_list,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
