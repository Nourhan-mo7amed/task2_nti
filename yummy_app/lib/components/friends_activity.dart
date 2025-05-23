import 'package:flutter/material.dart';

class FriendActivityCard extends StatelessWidget {
  final String image, text, time;
  final bool isDark;

  const FriendActivityCard({super.key, required this.image, required this.text, required this.time, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isDark ? Colors.grey[800] : const Color(0xFFFFEDF0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(backgroundImage: AssetImage(image), radius: 20),
          const SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text, style: TextStyle(fontSize: 15, color: isDark ? Colors.white : Colors.black)),
                const SizedBox(height: 4),
                Text(time, style: const TextStyle(fontSize: 10)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
