import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  NavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  final int currentIndex;
  final Function(int) onTap;
  final List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        color: Colors.red,
      ),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.shopping_cart,
        color: Colors.red,
      ), // Assuming an SVG icon
      label: 'Shop',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.account_circle,
        color: Colors.red,
      ),
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: TextTheme(
          caption: TextStyle(color: Colors.red),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        items: items,
      ),
    );
  }
}
