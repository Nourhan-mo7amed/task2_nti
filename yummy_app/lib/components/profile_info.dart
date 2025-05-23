import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  final bool isDark;

  const ProfileInfo({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final textColor = isDark ? Colors.white : Colors.black;

    return Column(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/images/profile2.jpg'),
          backgroundColor: Colors.grey,
        ),
        const SizedBox(height: 15),
        Text(
          'Nourhan Maghawry',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'nourhan@example.com',
          style: TextStyle(fontSize: 16, color: textColor.withOpacity(0.7)),
        ),
      ],
    );
  }
}
