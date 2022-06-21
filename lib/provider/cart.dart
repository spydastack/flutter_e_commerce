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

  bool isInCart(String productId) {
    return _cartItems.containsKey(productId);
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
      _cartItems[productId]!.quantity += 1;
    } else {
      _cartItems[productId] = CartItem(
        id: DateTime.now().toString(),
        productId: productId,
        name: name,
        price: price,
        quantity: 1,
        imageUrl: imageUrl,
      );
    }
    notifyListeners();
  }

  void deleteFromCart(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void reduceCartItem(String productId) {
    if (_cartItems[productId]!.quantity > 1) {
      _cartItems[productId]!.quantity -= 1;
    } else {
      _cartItems.remove(productId);
    }
    notifyListeners();
  }
}
