import 'package:flutter/material.dart';
import 'package:flutter_form/changeNotifier/cartNotifier.dart';
import 'package:flutter_form/models/RestaurantMenuItemModel.dart';
import 'package:flutter_form/screens/restaurantItemDetail_screen.dart';
import 'package:provider/provider.dart';

import 'package:transparent_image/transparent_image.dart';

class DiscoverMenuItem extends StatelessWidget {
  final RestaurantMenuItemModel restaurantMenuItemModel;

  DiscoverMenuItem({
    this.restaurantMenuItemModel,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CartNotifier>(
      builder: (context, cardNotifier, child) => Container(
        margin: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            border: Border.all(color: Colors.black, width: 1.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              )
            ]),
        constraints: BoxConstraints(minWidth: 300),
        //width: 300,
        height: 350,
        child: Column(
          children: [
            Row(
              children: [
                // Expanded(
                //   child: SizedBox(
                //     height: 250,
                //     child: Image.asset(
                //       'assets/images/crepe.jpg',
                //     ),
                //   ),
                // ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      cardNotifier.setSelectedRestaurantMenuItem(
                          this.restaurantMenuItemModel);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => RestaurantItemDetailScreen()));
                    },
                    child: Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          child: Stack(
                              // fit: StackFit.expand,
                              children: [
                                Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 20,
                                  ),
                                ),
                                Positioned.fill(
                                  child: FadeInImage.memoryNetwork(
                                      fit: BoxFit.fill,
                                      placeholder: kTransparentImage,
                                      image: this
                                          .restaurantMenuItemModel
                                          .imageUrl),
                                ),
                              ]),
                        ),
                        height: 250,
                        decoration: new BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 3),
                            )
                          ],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          // image: DecorationImage(
                          //   image: null,
                          //   fit: BoxFit.fill,
                          // ),
                        )),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 94,
                    padding: EdgeInsets.only(left: 10, top: 2),
                    decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[],
                        color: Color.fromRGBO(248, 237, 235, 0.5),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              Text(
                                this.restaurantMenuItemModel.title,
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Row(
                            children: [
                              Flexible(
                                child: Text(
                                  this.restaurantMenuItemModel.description,
                                  style: TextStyle(fontSize: 16),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                //width: 350,
                                constraints: BoxConstraints(maxWidth: 350),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                            child: Text(
                                          'Price: ${this.restaurantMenuItemModel.price} \$',
                                          textAlign: TextAlign.center,
                                        )),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              // Do something
                                              // Add data to list
                                              cardNotifier
                                                  .addRestaurantMenuItemToCart(this
                                                      .restaurantMenuItemModel);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Text(
                                                    'Added ${this.restaurantMenuItemModel.title} for ${this.restaurantMenuItemModel.price} in the cart'),
                                                action: SnackBarAction(
                                                  label: 'Undo',
                                                  onPressed: () {
                                                    cardNotifier
                                                        .removeRestaurantMenuItemFromCart(
                                                            this.restaurantMenuItemModel);
                                                  },
                                                ),
                                              ));
                                            },
                                            child: Text(
                                              'Add to cart',
                                              style: TextStyle(
                                                  color: Colors.blue[800],
                                                  decoration:
                                                      TextDecoration.underline),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
