import 'package:flutter/material.dart';

class MenuItemsList extends StatelessWidget {
  final Function({
    required String title,
    required String imageAsset,
    required String description,
    required double price,
  })
  onItemSelected;

  const MenuItemsList({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        _buildMenuItem(
          imageAsset: 'assets/images/rice.jpg',
          title: 'rice with grilled prawns',
          description:
              'Delicious grilled prawns served with a side of fragrant rice and fresh vegetables.',
          price: 14.99,
        ),
        _buildMenuItem(
          imageAsset: 'assets/images/pasta.jpg',
          title: 'pasta with cheese',
          description:
              'Soft organic tortillas filled with seasoned grilled prawns, fresh cabbage and avocado.',
          price: 16.99,
        ),
        _buildMenuItem(
          imageAsset: 'assets/images/food2.jpg',
          title: 'Blue Prawn Risotto',
          description:
              'Creamy organic Arborio rice cooked with white wine and garlic, enriched with prawns.',
          price: 19.99,
        ),
        const SizedBox(height: 100),
      ]),
    );
  }

  Widget _buildMenuItem({
    required String imageAsset,
    required String title,
    required String description,
    required double price,
  }) {
    return GestureDetector(
      onTap:
          () => onItemSelected(
            title: title,
            imageAsset: imageAsset,
            description: description,
            price: price,
          ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '\$$price',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Icon(Icons.thumb_up, size: 16, color: Colors.green),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imageAsset,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
