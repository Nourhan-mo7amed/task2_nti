import 'package:flutter/material.dart';

import 'core/theme_app.dart';
import 'views/account_screen.dart';
import 'views/explore_screen.dart';
import 'views/order_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;
  int currentIndex = 0;

  void toggleTheme() => setState(() => isDark = !isDark);
  void onTabTapped(int index) => setState(() => currentIndex = index);

  @override
  Widget build(BuildContext context) {
    final screens = [
      ExploreScreen(isDark: isDark, toggleTheme: toggleTheme),
      OrdersScreen(isDark: isDark, toggleTheme: toggleTheme),
      AccountScreen(isDark: isDark, toggleTheme: toggleTheme),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
      home: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTabTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Explore'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Orders'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
          ],
        ),
      ),
    );
  }
}
