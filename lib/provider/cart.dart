import 'package:ecommerce_app/models/cart_item.dart';
import 'package:flutter/foundation.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _cartItems = {};

  Map<String, CartItem> get cartItems {
    return {..._cartItems};
  }

  int get cartCount {
    return _cartItems.length;
  }

  double get cartTotal {
    double total = 0.0;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(
    String productId,
    String name,
    double price,
    String imageUrl,
  ) {
    if (_cartItems.containsKey(productId)) {
      _cartItems[productId]!.quantity + 1;
    } else {
      _cartItems[productId] = CartItem(
        productId: productId,
        name: name,
        price: price,
        quantity: 1,
        imageUrl: imageUrl,
      );
    }
    notifyListeners();
  }
}
