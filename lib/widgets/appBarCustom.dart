import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form/changeNotifier/pageViewChangeNotifier.dart';
import 'package:flutter_form/screens/cart_screen.dart';
import 'package:provider/provider.dart';

class AppBarCustom extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey;

  AppBarCustom(this._drawerKey) {}
  @override
  Widget build(BuildContext context) => Consumer<PageViewChangeNotifier>(
        builder: (context, pageViewChangeNotifier, child) => AppBar(
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
                icon: Badge(
                    showBadge: false,
                    position: BadgePosition.topEnd(top: -13),
                    badgeContent: Text(
                      '',
                      style: TextStyle(color: Colors.white),
                    ),
                    child: Icon(Icons.shopping_cart)),
                onPressed: () {
                  // open the Cart Page
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => CartScreen()));
                })
          ],
        ),
      );
}
