import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form/animation/pageTransition.dart';
import 'package:flutter_form/changeNotifier/cartNotifier.dart';
import 'package:flutter_form/constant/Constant.dart';
import 'package:flutter_form/models/RestaurantMenuItemModel.dart';
import 'package:flutter_form/widgets/cartItem.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) =>
      Consumer<CartNotifier>(builder: (context, cartNotifier, child) {
        // set The iterater
        cartNotifier.setIterable();

        return Scaffold(
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
                              cartNotifier.deleteAllCartItems();
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Yes',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
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
            child: (cartNotifier.mapRestaurentMenuItems.isNotEmpty)
                ? ListView.builder(
                    itemCount: cartNotifier.mapRestaurentMenuItems.length,
                    itemBuilder: (context, index) {
                      // Get The MapEnty
                      // Then Pass the RestaurantMenuItem and int to the
                      // corresponding fields

                      // This is an iterator method
                      MapEntry<RestaurantMenuItemModel, int> mapCartItems =
                          cartNotifier
                              .getRestaurantMapEntryMenuItemFromIterator();

                      return CartItem(
                        mapEntryRestaurentMenuItemModel: mapCartItems,
                        index: ++index,
                      );
                    },
                  )
                : Center(
                    child: Text('Cart is empty'),
                  ),
          ),
          floatingActionButton: Container(
            width: 300,
            padding: EdgeInsets.only(bottom: 30),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black)),
              child: Text(
                'Purchase Items for : ${cartNotifier.totalPriceOfCartsItems.toStringAsFixed(2)} \$',
                style: TextStyle(color: Color(0xFFf1dca7)),
              ),
              onPressed: () {
                // On Check Out if there is a least one item in the cart
                // We need to recalculate in the items in the cart before showing the checkout page
                if (cartNotifier.checkCartItemsForAtLeastOneValue()) {
                  // Navigator.of(context)
                  //     .push(createRouteFromCartScreenToCheckOutScreen());
                  Navigator.of(context)
                      .push(createRouteFromCartScreenToPaypalCheckoutScreen());
                }
              },
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      });
}
