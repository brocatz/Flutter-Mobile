import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form/widgets/discoverMenuItem.dart';

class HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(32, 32, 32, 0.5)),
      child: ListView(
        padding: EdgeInsets.only(
          top: 10,
          left: 20,
          right: 20,
        ),
        children: <Widget>[
          DiscoverMenuItem(),
          SizedBox(
            height: 5,
          ),
          DiscoverMenuItem(),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
