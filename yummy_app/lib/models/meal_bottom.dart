import 'package:flutter/material.dart';

class MealBottomSheetContent extends StatelessWidget {
  final String title;
  final String imageAsset;
  final String description;
  final double price;
  final int quantity;
  final VoidCallback? onDecrement;
  final VoidCallback onIncrement;
  final VoidCallback onAddToCart;

  const MealBottomSheetContent({
    super.key,
    required this.title,
    required this.imageAsset,
    required this.description,
    required this.price,
    required this.quantity,
    required this.onDecrement,
    required this.onIncrement,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(imageAsset, height: 150, fit: BoxFit.cover),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(description, style: TextStyle(color: Colors.grey[700])),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: onDecrement,
              ),
              Text('$quantity', style: const TextStyle(fontSize: 18)),
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: onIncrement,
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink[100],
              foregroundColor: Colors.black,
            ),
            onPressed: onAddToCart,
            child: Text(
              'Add $quantity to Cart - \$${(price * quantity).toStringAsFixed(2)}',
            ),
          ),
        ],
      ),
    );
  }
}