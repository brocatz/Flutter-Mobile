import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      padding: EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Expanded(
                child: DrawerHeader(
                    padding: EdgeInsets.fromLTRB(30.0, 16.0, 16.0, 8.0),
                    decoration: BoxDecoration(color: Colors.transparent),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('assets/images/Me.jpg'),
                        ),
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
              ),
            ],
          ),
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
    ));
  }
}
