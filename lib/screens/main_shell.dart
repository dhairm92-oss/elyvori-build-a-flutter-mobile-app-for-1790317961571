import 'package:flutter/material.dart';
import 'home_tab.dart';
import 'menu_tab.dart';
import 'order_tab.dart';
import 'activity_tab.dart';
import 'rewards_tab.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    const HomeTab(),
    const MenuTab(),
    const OrderTab(),
    const ActivityTab(),
    const RewardsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBEB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFBEB),
        elevation: 0,
        title: Row(
          children: const [
            Icon(Icons.coffee, color: Color(0xFFD97706)),
            SizedBox(width: 8),
            Text(
              'Sunrise Coffee Co.',
              style: TextStyle(
                color: Color(0xFF2C1810),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFFD97706),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Order'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Activity'),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Rewards'),
        ],
      ),
    );
  }
}
