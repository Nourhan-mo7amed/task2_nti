import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String image;
  const CategoryCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(image, height: 200, width: 220, fit: BoxFit.fill),
    );
  }
}
