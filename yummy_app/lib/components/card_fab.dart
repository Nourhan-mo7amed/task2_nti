import 'package:flutter/material.dart';

class CartFAB extends StatelessWidget {
  final int itemCount;
  final VoidCallback onPressed;

  const CartFAB({
    super.key, 
    required this.itemCount,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: Colors.pink[100],
      onPressed: onPressed,
      icon: const Icon(Icons.shopping_cart, color: Colors.black),
      label: Text(
        '$itemCount Items in cart',
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}