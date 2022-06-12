class CartItem {
  final String name;
  final String productId;
  final int quantity;
  final double price;
  final String imageUrl;
  CartItem({
    required this.name,
    required this.productId,
    required this.quantity,
    required this.price,
    required this.imageUrl,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      name: json['name'] as String,
      productId: json['productId'] as String,
      quantity: json['quantity'] as int,
      price: json['price'].toDouble(),
      imageUrl: json['imageUrl'] as String,
    );
  }
}
