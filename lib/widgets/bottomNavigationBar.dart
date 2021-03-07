import 'package:flutter/material.dart';
import 'package:flutter_form/changeNotifier/pageViewChangeNotifier.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    return Consumer<PageViewChangeNotifier>(
        builder: (context, pageViewChanger, child) {
      return BottomNavigationBar(
        backgroundColor: Color(0xFF1d2d44),
        elevation: 4.0,
        currentIndex: pageViewChanger.currentViewPage,
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
          if (index == pageViewChanger.currentPage) return;
          // Update the state to reflect the icon that we press
          pageViewChanger.setCurrentPage(index);
          // Updates view the to show the the current PageView that we click
          pageViewChanger.getCurrentPageController.animateToPage(index,
              duration: Duration(milliseconds: 400), curve: Curves.easeInOut);

          // setState(() {
          //   currentIndex = index;
          // });
          // Here we do a transition from Page View
          /* widget.pageViewController.animateToPage(index,
              duration: Duration(milliseconds: 500), curve: Curves.bounceIn); */
        },
      );
    });
  }
}
