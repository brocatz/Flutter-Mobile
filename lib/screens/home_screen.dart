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
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      userModel =
          UserModel(displayName: user.displayName, emailAddress: user.email);
      if (user == null) {
        Navigator.popUntil(context, ModalRoute.withName("/"));
      }
    });
    return Scaffold(
        key: _drawerKey,
        drawer: Drawer(
            child: Container(
          padding: EdgeInsets.only(
            top: 20,
          ),
          child: Column(
            children: <Widget>[
              DrawerHeader(
                  decoration: BoxDecoration(color: Colors.green),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(radius: 50),
                      SizedBox(height: 10),
                      Text(
                        'FirstName',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  )),
              Expanded(
                  child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.account_circle_rounded),
                    title: Text(
                      'Profile',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.fastfood),
                    title: Text(
                      'Orders',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text(
                      'Setting',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              )),
              Container(
                alignment: FractionalOffset.bottomCenter,
                child: Column(
                  children: <Widget>[
                    Divider(
                      thickness: 2,
                    ),
                    ListTile(
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.popUntil(context, ModalRoute.withName('/'));
                      },
                      leading: Icon(Icons.exit_to_app),
                      title: Text(
                        'Log Out',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          decoration: BoxDecoration(color: Color(0xFF1d2d44)),
        )),
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
          elevation: 16.0,
        ),
        body: Center(
          child: Text('Welcome and there is nothing to see here'),
        ));
  }
}
