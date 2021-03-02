import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigatonBarState createState() =>
      _CustomBottomNavigatonBarState();
}

class _CustomBottomNavigatonBarState extends State<CustomBottomNavigationBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xFF1d2d44),
      elevation: 4.0,
      currentIndex: currentIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Search',
          icon: Icon(Icons.search),
        ),
        BottomNavigationBarItem(
          label: 'Orders',
          icon: Icon(Icons.food_bank),
        ),
      ],
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
    );
  }
}
