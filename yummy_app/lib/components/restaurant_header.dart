import 'package:flutter/material.dart';

class RestaurantHeader extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onMenu;

  const RestaurantHeader({
    super.key,
    required this.onBack,
    required this.onMenu,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/images/burger.jpg',
            width: double.infinity,
            height: 350,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: 40,
            left: 16,
            child: CircleAvatar(
              backgroundColor: Colors.white70,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.black,
                onPressed: onBack,
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 16,
            child: GestureDetector(
              onTap: onMenu,
              child: CircleAvatar(
                backgroundColor: Colors.white70,
                child: const Icon(Icons.menu, color: Colors.black),
              ),
            ),
          ),
          Positioned(
            left: 20.0,
            bottom: -20,
            child: CircleAvatar(
              radius: 30.0,
              backgroundColor: Colors.pink.shade100,
              child: const Icon(Icons.store_sharp, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
