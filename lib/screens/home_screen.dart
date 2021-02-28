import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form/models/UserModel.dart';

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
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      userModel =
          UserModel(displayName: user.displayName, emailAddress: user.email);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _drawerKey,
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text('Hello '),
                decoration: BoxDecoration(color: Color(0xFF1d2d44)),
              ),
            ],
          ),
        ),
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
        ),
        body: Center(
          child: Text('Welcome and there is nothing to see here'),
        ));
  }
}
