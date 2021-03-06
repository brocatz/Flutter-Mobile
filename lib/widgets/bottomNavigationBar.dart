import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final PageController pageViewController;

  CustomBottomNavigationBar({this.pageViewController});

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
      selectedItemColor: Colors.white,
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
        if (index == currentIndex) return;
        setState(() {
          currentIndex = index;
        });
        // Here we do a transition from Page View
        /* widget.pageViewController.animateToPage(index,
            duration: Duration(milliseconds: 500), curve: Curves.bounceIn); */
      },
    );
  }
}
