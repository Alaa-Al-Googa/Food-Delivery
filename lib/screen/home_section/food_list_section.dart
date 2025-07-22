import 'package:flutter/material.dart';
import 'package:gazaburger/screen/details_screen.dart';

class FoodListSection extends StatelessWidget {
  final List<Map<String, dynamic>> burgers = [
    {
      'name': 'Ordinary Burgers',
      'image': 'assets/images/image 1.png',
      'rating': 4.9,
      'distance': '190m',
      'price': '\$17,230',
    },
    {
      'name': 'Burger With Meat',
      'image': 'assets/images/image 1.png',
      'rating': 4.9,
      'distance': '190m',
      'price': '\$17,230',
    },
    {
      'name': 'Special BBQ',
      'image': 'assets/images/image 1.png',
      'rating': 4.9,
      'distance': '190m',
      'price': '\$17,230',
    },
    {
      'name': 'Double Cheese',
      'image': 'assets/images/image 1.png',
      'rating': 4.9,
      'distance': '190m',
      'price': '\$17,230',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: burgers.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.69,
      ),
      itemBuilder: (context, index) {
        final item = burgers[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return DetailsScreen();
                },
              ),
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),
                      child: Image.asset(
                        item['image'],
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.favorite_border, color: Colors.red),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item['name'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Color(0xffFE8C00), size: 16),
                      SizedBox(width: 4),
                      Text('${item['rating']}'),
                      Spacer(),
                      Icon(
                        Icons.location_on,
                        color: Color(0xffFE8C00),
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Text(item['distance']),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item['price'],
                    style: TextStyle(
                      color: Color(0xffFE8C00),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
