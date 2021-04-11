import 'package:flutter/material.dart';
import 'package:flutter_form/changeNotifier/cartNotifier.dart';
import 'package:flutter_form/constant/Constant.dart';
import 'package:flutter_form/constant/ConstantTest.dart';
import 'package:provider/provider.dart';

class RestaurantItemDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartNotifier>(
      builder: (context, cartNotifier, child) => Scaffold(
        appBar: AppBar(
          title: Text('Food Detail'),
          centerTitle: true,
          backgroundColor: primaryColor,
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(color: backgroundColor),
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.elliptical(15, 20),
                            topRight: Radius.elliptical(15, 20),
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(cartNotifier
                                .selectedRestaurantMenuItem.imageUrl)),
                      ),
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: Colors.black, width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            height: 300,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            // boxShadow: <BoxShadow>[
                                            //   BoxShadow(
                                            //       color: Colors.black
                                            //           .withOpacity(.5),
                                            //       spreadRadius: -12.0,
                                            //       blurRadius: 12),
                                            // ],
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15)),
                                            color: Colors.blueGrey
                                                .withOpacity(.5)),
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            cartNotifier
                                                .selectedRestaurantMenuItem
                                                .title,
                                            style: TextStyle(fontSize: 25),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top: 10, left: 20, right: 20),
                                        child: Text(
                                          cartNotifier
                                              .selectedRestaurantMenuItem
                                              .description,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 20,
                                            wordSpacing: 1,
                                            letterSpacing: 1,
                                          ),
                                          maxLines: 6,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
