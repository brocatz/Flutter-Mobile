import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form/constant/Constant.dart';
import 'package:flutter_form/widgets/mini/counter.dart';

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
          padding: EdgeInsets.only(top: 10.0, left: 20, right: 20),
          child: ListView(
            children: [
              Dismissible(
                key: ValueKey('a'),
                child: Container(
                  width: 250,
                  height: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 10, top: 2),
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(.85),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15))),
                              child: Row(children: [
                                Container(
                                  constraints: BoxConstraints(
                                      minWidth: 80, maxWidth: 80),
                                  child: Text(
                                    'No .1',
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  child: Text('Crepes',
                                      style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ]),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            // decoration: BoxDecoration(color: Colors.blueGrey),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 90,
                                  constraints: BoxConstraints(
                                      minWidth: 90, maxWidth: 90),
                                  padding: EdgeInsets.only(top: 10),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Price',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Container(
                                        height: 40,
                                        child: Center(
                                            child: Text(
                                          "300\$",
                                          style: TextStyle(fontSize: 20),
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: Container(
                                    width: 150,
                                    constraints: BoxConstraints(maxWidth: 175),
                                    // decoration:
                                    //     BoxDecoration(color: Colors.green),
                                    child: Text(
                                      'Quanity',
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                                Counter(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 6),
              Dismissible(
                background: Container(
                  child: Center(
                      child: Text(
                    'Remove Element',
                    style: TextStyle(fontSize: 30),
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.red,
                  ),
                ),
                key: ValueKey('rgr'),
                child: Container(
                  width: 250,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: Container(
          width: 300,
          padding: EdgeInsets.only(bottom: 30),
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.black)),
            child: Text('Buy Items'),
            onPressed: () {},
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
}
