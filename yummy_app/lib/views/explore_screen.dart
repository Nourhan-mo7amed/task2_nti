import 'package:flutter/material.dart';

import '../components/category_card.dart';
import '../components/food_card.dart';
import '../components/friends_activity.dart';
import 'restaurant_screen.dart';

class ExploreScreen extends StatelessWidget {
  final bool isDark;
  final VoidCallback toggleTheme;

  const ExploreScreen({
    super.key,
    required this.isDark,
    required this.toggleTheme,
  });

  final Color pinkColor = const Color(0xFFFFEDF0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: isDark ? Colors.black : Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
              color: isDark ? Colors.white : Colors.black,
            ),
            onPressed: toggleTheme,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitle("Food near me"),
            buildFoodList(context),
            const SizedBox(height: 20),
            buildTitle("Friend's Activity"),
            buildFriendList(),
            const SizedBox(height: 20),
            buildTitle("Categories"),
            buildCategoryList(),
          ],
        ),
      ),
    );
  }

  Widget buildTitle(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: isDark ? Colors.white : Colors.black,
      ),
    );
  }

  Widget buildFoodList(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RestaurantScreen()),
                ),
            child: FoodCard(
              image: 'assets/images/image.png',
              title: 'The Blue Prawn',
              subtitle: 'Seafood, Healthy, Organic',
              isDark: isDark,
            ),
          ),
          const SizedBox(width: 12),
          FoodCard(
            image: 'assets/images/pasta.jpg',
            title: "Pizza Hut",
            subtitle: 'Pizza, Italian',
            isDark: isDark,
          ),
          const SizedBox(width: 12),
          FoodCard(
            image: 'assets/images/food3.jpg',
            title: "Mama Rosa's",
            subtitle: 'Pizza, Italian',
            isDark: isDark,
          ),
        ],
      ),
    );
  }

  Widget buildFriendList() {
    return SizedBox(
      height: 90,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          FriendActivityCard(
            image: 'assets/images/profileCAT.jpeg',
            text: 'Made this delicious pizza this morning',
            time: '10 mins ago',
            isDark: isDark,
          ),
          const SizedBox(width: 12),
          FriendActivityCard(
            image: 'assets/images/profile.jpg',
            text: 'Made shrimp salad',
            time: '80 mins ago',
            isDark: isDark,
          ),
        ],
      ),
    );
  }

  Widget buildCategoryList() {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoryCard(image: 'assets/images/food2.jpg'),
          const SizedBox(width: 12),
          CategoryCard(image: 'assets/images/pizza.jpg'),
          const SizedBox(width: 12),
          CategoryCard(image: 'assets/images/rice.jpg'),
        ],
      ),
    );
  }
}
