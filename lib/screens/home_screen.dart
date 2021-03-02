import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form/models/UserModel.dart';
import 'package:flutter_form/pageViews/homePageView.dart';
import 'package:flutter_form/widgets/bottomNavigationBar.dart';
import 'package:flutter_form/widgets/drawer.dart';

// Is the main section of the app
// The other section will be pageView with a pageController

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

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
    return Scaffold(
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
      body: PageView(
        children: <Widget>[
          HomePageView(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  // Define the pages so that user will be able to left or rigth depend
  // on their location in the
  Widget pageView() {
    final PageController controller = PageController(initialPage: 0);
    return PageView(
      controller: controller,
      children: <Widget>[],
    );
  }
}
