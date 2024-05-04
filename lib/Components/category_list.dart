import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'name': 'Vegetables', 'imagePath': 'assets/carrot.png', 'color': Colors.greenAccent},
    {'name': 'Fruits', 'imagePath': 'assets/fruit.png', 'color': Colors.red[100]},
    {'name': 'Dairy', 'imagePath': 'assets/milk.png', 'color': Colors.lightBlueAccent[100]},
    {'name': 'Beverages', 'imagePath': 'assets/beverages.png', 'color': Colors.orangeAccent[100]},
    {'name': 'Snacks', 'imagePath': 'assets/snack.png', 'color': Colors.yellowAccent[100]},
    {'name': 'Bakery', 'imagePath': 'assets/bread.png', 'color': Colors.brown[100]},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
      child: SizedBox(
        height: 80,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: CategoryCircle(
                category: categories[index]['name'],
                imagePath: categories[index]['imagePath'],
                color: categories[index]['color'],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CategoryCircle extends StatelessWidget {
  final String category;
  final String imagePath;
  final Color color;

  const CategoryCircle({
    Key? key,
    required this.category,
    required this.imagePath,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Image.asset(
              imagePath,
              width: 40,
              height: 40,
            ),
          ),
        ),
        SizedBox(height: 4),
        Text(
          category,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
