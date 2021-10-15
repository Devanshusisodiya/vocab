import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.purple[100],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      showUnselectedLabels: false,
      showSelectedLabels: true,
      elevation: 10,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.sort_by_alpha), label: 'Words'),
        BottomNavigationBarItem(
            icon: Icon(Icons.format_align_justify), label: 'Tests'),
        BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Mastered'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite')
      ],
    );
  }
}
