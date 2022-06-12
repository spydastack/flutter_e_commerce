import 'package:flutter/material.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(50),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/empty_cart.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        const Text(
          "Your cart is empty",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          height: 40,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.grey, // background
              onPrimary: Colors.black, // foreground
            ),
            onPressed: () {},
            child: const Text(
              "Shop now",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        )
      ],
    );
  }
}
