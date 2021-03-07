import 'package:flutter/cupertino.dart';

// This class is responsable for storing the current PageView and
// affecting the result to display the rigth Icon on the bottom NavigatorBar

// This class is also reposable for calling to pageView to change when the user
// pressed the buttons on the Bottom Navigation Bar

// The PageView and BottomNavigation Bar are both consumers
class PageViewChangeNotifier with ChangeNotifier {
  int currentPage = 0;
  PageController pageController = PageController(initialPage: 0);

  int get currentViewPage => currentPage;
  PageController get getCurrentPageController => pageController;

  void setCurrentPageFromBottomNavigationBar(int setCurrentPage) {
    pageController.animateToPage(setCurrentPage,
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    notifyListeners();
  }

  void setCurrentPage(int setCurrentPage) {
    currentPage = setCurrentPage;
    notifyListeners(); // this method cause the ui to rebuild itself
  }
}
