import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final int index;
  const CategoryItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  final List<Map<String, Object>> categories = const [
    {
      'name': 'T-Shirts',
      'imageUrl':
          'assets/images/charming-curly-woman-white-blouse-smiles-sincerely-looks-front-poses-cozy-dressing-room.jpg',
    },
    {
      'name': 'Shirts',
      'imageUrl': 'assets/images/female-friends-out-shopping-together.jpg',
    },
    {
      'name': 'Pants',
      'imageUrl':
          'assets/images/woman-black-trousers-purple-blouse-laughs-leaning-stand-with-elegant-clothes-pink-background.jpg',
    },
    {
      'name': 'Shoes',
      'imageUrl': 'assets/images/female-friends-out-shopping-together.jpg',
    },
    {
      'name': 'Dress',
      'imageUrl':
          'assets/images/charming-curly-woman-white-blouse-smiles-sincerely-looks-front-poses-cozy-dressing-room.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('${categories[index]['imageUrl']}'),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 20,
          child: Text(
            '${categories[index]['name']}',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
