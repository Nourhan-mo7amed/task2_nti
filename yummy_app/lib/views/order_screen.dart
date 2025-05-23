import 'package:flutter/material.dart';

import '../components/dummy.dart';
import '../components/ordar_card.dart';

class OrdersScreen extends StatelessWidget {
  final bool isDark;
  final VoidCallback toggleTheme;

  const OrdersScreen({
    super.key,
    required this.isDark,
    required this.toggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: isDark ? Colors.black : Colors.white,
        elevation: 0,
        leading: const BackButton(),
        actions: [
          IconButton(
            icon: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
              color: isDark ? Colors.white : Colors.black,
            ),
            onPressed: toggleTheme,
          ),
        ],
        title: Text(
          'My Orders',
          style: TextStyle(color: isDark ? Colors.white : Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyOrders.length,
          itemBuilder: (context, index) {
            final order = dummyOrders[index];
            return OrderCard(order: order, isDark: isDark);
          },
        ),
      ),
    );
  }
}
