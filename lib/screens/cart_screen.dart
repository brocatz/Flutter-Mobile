import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form/constant/Constant.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
          centerTitle: true,
          backgroundColor: primaryColor,
        ),
        body: Container(
          decoration: BoxDecoration(color: backgroundColor),
        ),
        floatingActionButton: Container(
          width: 300,
          child: ElevatedButton(
            child: Text('Buy Items'),
            onPressed: () {},
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
}
