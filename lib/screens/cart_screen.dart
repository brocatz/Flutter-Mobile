import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form/changeNotifier/cartNotifier.dart';
import 'package:flutter_form/constant/Constant.dart';
import 'package:flutter_form/widgets/cartItem.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) => Consumer<CartNotifier>(
        builder: (context, cartNotifier, child) => Scaffold(
          appBar: AppBar(
            title: Text("Cart"),
            centerTitle: true,
            backgroundColor: primaryColor,
            actions: [
              // IconButton(icon: Icon(Icons.more_horiz), onPressed: () {}),
              // PopUpMenuOptionType is an custom enum define in constant/Constant.dart
              PopupMenuButton<PopUpMenuOptionType>(
                icon: Icon(Icons.more_horiz),
                onSelected: (PopUpMenuOptionType value) {
                  if (value == PopUpMenuOptionType.delete) {
                    // show an option Menu to user
                    // Asking them if they want to really delete the cart
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) => CupertinoAlertDialog(
                        title: Text('Empty Cart'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: [
                              Text('Do you really want to empty the Cart'),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              // do something here
                              // then pop
                              Navigator.of(context).pop();
                            },
                            child: Text('Yes'),
                          ),
                          TextButton(
                            onPressed: () {
                              // do something here
                              // then pop
                              Navigator.of(context).pop();
                            },
                            child: Text('No'),
                          )
                        ],
                      ),
                    );
                  }
                },
                itemBuilder: (value) => <PopupMenuEntry<PopUpMenuOptionType>>[
                  const PopupMenuItem<PopUpMenuOptionType>(
                      value: PopUpMenuOptionType.delete,
                      child: Text(
                        'Delete',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ))
                ],
              )
            ],
          ),
          body: Container(
            decoration: BoxDecoration(color: backgroundColor),
            padding: EdgeInsets.only(top: 10.0, left: 20, right: 20),
            child: ListView.builder(
              itemCount: cartNotifier.listRestaurentMenuItem.length,
              itemBuilder: (context, index) {
                return CartItem(
                  restaurantMenuItemModel:
                      cartNotifier.listRestaurentMenuItem[index],
                );
              },
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      );
}
