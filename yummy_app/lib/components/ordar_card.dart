import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final Map<String, String> order;
  final bool isDark;

  const OrderCard({
    super.key,
    required this.order,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isDark ? Colors.grey[900] : Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Image.asset(
          order['image']!,
          height: 50,
          width: 50,
          fit: BoxFit.cover,
        ),
        title: Text(
          order['title']!,
          style: TextStyle(color: isDark ? Colors.white : Colors.black),
        ),
        subtitle: Text(
          order['details']!,
          style: TextStyle(
            color: isDark ? Colors.grey[400] : Colors.black54,
          ),
        ),
      ),
    );
  }
}
