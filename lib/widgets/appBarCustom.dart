import 'package:flutter/material.dart';
import 'package:flutter_form/changeNotifier/pageViewChangeNotifier.dart';
import 'package:provider/provider.dart';

class AppBarCustom extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey;

  AppBarCustom(this._drawerKey);
  @override
  Widget build(BuildContext context) => Consumer<PageViewChangeNotifier>(
        builder: (context, pageViewChangeNotifier, child) => AppBar(
          title: AnimatedCrossFade(
            crossFadeState: CrossFadeState.showFirst,
            duration: Duration(milliseconds: 500),
            firstChild: Text('Discover'),
            secondChild: Text('Home'),
          ),
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
      );
}
