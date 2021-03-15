import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form/changeNotifier/cartNotifier.dart';
import 'package:flutter_form/screens/cart_screen.dart';
import 'package:provider/provider.dart';

AppBar appBar(GlobalKey<ScaffoldState> _drawerKey, BuildContext context) {
  return AppBar(
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
      Consumer<CartNotifier>(
        builder: (context, cartNotifier, child) => IconButton(
            icon: Badge(
                showBadge: cartNotifier.showBadgeNotification,
                position: BadgePosition.topEnd(top: -13),
                badgeContent: Text(
                  cartNotifier.totalNumberOfSelectedItems.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                child: Icon(Icons.shopping_cart)),
            onPressed: () {
              // open the Cart Page
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => CartScreen()));
            }),
      )
    ],
  );
}
