class CartItem {
  final String id;
  final String name;
  final String productId;
  int quantity;
  final double price;
  final String imageUrl;
  CartItem({
    required this.name,
    required this.id,
    required this.productId,
    required this.quantity,
    required this.price,
    required this.imageUrl,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'] as String,
      productId: json['productId'] as String,
      name: json['name'] as String,
      quantity: json['quantity'] as int,
      price: json['price'].toDouble(),
      imageUrl: json['imageUrl'] as String,
    );
  }
}
