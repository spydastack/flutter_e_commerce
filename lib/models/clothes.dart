import '../dummy_data/dummy_data.dart';

class Clothes {
  String id;
  String name;
  String? description;
  String imageUrl;
  String price;
  String category;
  String? color;
  String? size;
  Clothes({
    required this.id,
    required this.name,
    this.description,
    required this.imageUrl,
    required this.price,
    required this.category,
    this.color,
    this.size,
  });

  factory Clothes.fromJson(Map<String, dynamic> json) {
    return Clothes(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String,
      price: json['price'] as String,
      category: json['category'] as String,
      color: json['color'] as String?,
      size: json['size'] as String?,
    );
  }

  static List<Clothes> generateClothes() {
    return dummyClothesData
        .map(
          (e) => Clothes.fromJson(e),
        )
        .toList();
  }
}
