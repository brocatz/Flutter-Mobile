import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form/models/RestaurantMenuItemModel.dart';

import 'mini/counter.dart';

class CartItem extends StatelessWidget {
  final RestaurantMenuItemModel restaurantMenuItemModel;
  final int index;

  CartItem({
    @required this.restaurantMenuItemModel,
    @required this.index,
  });
  @override
  Widget build(BuildContext context) => Dismissible(
        key: ValueKey('a'),
        onDismissed: (dismissDirection) {
          // remove element
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          width: 250,
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              border: Border.all(color: Colors.black, width: 1.0),
              color: Colors.blueGrey),
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
                      child: Material(
                        color: Colors.transparent,
                        elevation: 12.0,
                        child: Row(children: [
                          Container(
                            constraints:
                                BoxConstraints(minWidth: 80, maxWidth: 80),
                            child: Text(
                              'No .${this.index}',
                              style: TextStyle(
                                  color: Color(0xFFf1dca7),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text(this.restaurantMenuItemModel.title,
                                style: TextStyle(
                                    color: Color(0xFFf1dca7),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    // decoration: BoxDecoration(color: Colors.blueGrey
                    // border: Border(left : BorderSide(color: Colors.black,width: 1.0)),
                    // ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 90,
                          constraints:
                              BoxConstraints(minWidth: 90, maxWidth: 90),
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
                                  "${this.restaurantMenuItemModel.price}\$",
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
      );
}
