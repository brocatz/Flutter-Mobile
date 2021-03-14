import 'package:flutter/cupertino.dart';

// This class is responsable for storing the current PageView and
// affecting the result to display the rigth Icon on the bottom NavigatorBar

// This class is also reposable for calling to pageView to change when the user
// pressed the buttons on the Bottom Navigation Bar

// The PageView and BottomNavigation Bar are both consumers
class PageViewChangeNotifier with ChangeNotifier {
  int currentPage = 0;
  PageController pageController = PageController(initialPage: 0);

  List<String> appBarTitle = ['Discover', 'Search', 'Order'];
  String firstTitle;
  String secondTitle;

  int get currentViewPage => currentPage;
  PageController get getCurrentPageController => pageController;

  void setCurrentPageFromBottomNavigationBar(int setCurrentPage) {
    // To make the animation more smooth

    int pageDifference = (setCurrentPage - pageController.initialPage).abs();

    pageController.animateToPage(setCurrentPage,
        duration: Duration(milliseconds: 500 * (pageDifference)),
        curve: Curves.easeIn);
    // We don t need to call notifyListener because we are not updating the Ui
    // we are calling the pageController to do that for us
    // notifyListeners();
  }

  void setCurrentPage(int setCurrentPage) {
    currentPage = setCurrentPage;
    notifyListeners(); // this method cause the ui to rebuild itself
  }
}
