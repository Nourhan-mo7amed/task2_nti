import 'package:flutter/material.dart';

import '../components/account_option.dart';
import '../components/profile_info.dart';

class AccountScreen extends StatelessWidget {
  final bool isDark;
  final VoidCallback toggleTheme;

  const AccountScreen({
    super.key,
    required this.isDark,
    required this.toggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = isDark ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: isDark ? Colors.black : Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
              color: textColor,
            ),
            onPressed: toggleTheme,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfileInfo(isDark: isDark),
            const SizedBox(height: 30),
            AccountOption(title: 'View Profile', isDark: isDark),
            const SizedBox(height: 20),
            AccountOption(title: 'Logout', isDark: isDark),
          ],
        ),
      ),
    );
  }
}
