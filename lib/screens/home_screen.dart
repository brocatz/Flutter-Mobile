import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form/models/UserModel.dart';
import 'package:flutter_form/widgets/drawer.dart';

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
        title: Text('HomePage'),
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
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.green),
              child: Text('Text'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF1d2d44),
        elevation: 4.0,
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
      ),
    );
  }
}
