import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form/changeNotifier/pageViewChangeNotifier.dart';
import 'package:flutter_form/models/UserModel.dart';
import 'package:flutter_form/pageViews/homePageView.dart';
import 'package:flutter_form/pageViews/searchPageView.dart';
import 'package:flutter_form/widgets/bottomNavigationBar.dart';
import 'package:flutter_form/widgets/drawer.dart';

import 'package:provider/provider.dart';

// Is the main section of the app
// The other section will be pageView with a pageController

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  // final PageController controller = PageController(initialPage: 0);

  UserModel userModel;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      userModel =
          UserModel(displayName: user.displayName, emailAddress: user.email);
      if (user == null) {
        Navigator.popUntil(context, ModalRoute.withName("/"));
      }
      print(user);
    });
    return ChangeNotifierProvider(
      create: (context) => PageViewChangeNotifier(),
      child: Scaffold(
        key: _drawerKey,
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Text('Discover'),
          backgroundColor: Color(0xFF1d2d44),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _drawerKey.currentState.openDrawer();
            },
          ),
          elevation: 4.0,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  // do something here
                })
          ],
        ),
        body: _pageView(),
        bottomNavigationBar: CustomBottomNavigationBar(),
      ),
    );
  }

  // Define the pages so that user will be able to left or rigth depend
  // on their location in the
  // animateToPage Method in the page view
  Widget _pageView() {
    // final PageController controller = PageController(initialPage: 0);
    return Consumer<PageViewChangeNotifier>(
        builder: (context, pageViewChangeNotifier, child) {
      return PageView(
        onPageChanged: (value) {
          // Get the current Page from the PageView to update the Bottom Navigation Bar
          pageViewChangeNotifier.setCurrentPage(value);
        },
        controller: pageViewChangeNotifier.getCurrentPageController,
        children: <Widget>[
          HomePageView(),
          SearchPageView(),
        ],
      );
    });
  }
}
