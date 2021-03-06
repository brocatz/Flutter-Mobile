import 'package:flutter/material.dart';
import 'package:flutter_form/screens/restaurantItemDetail_screen.dart';

class DiscoverMenuItem extends StatelessWidget {
  String imageUrl;
  String title;
  String price;
  String description;

  DiscoverMenuItem({this.title, this.price, this.imageUrl, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      width: 300,
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => RestaurantItemDetailScreen()));
                  },
                  child: Container(
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
                        image: DecorationImage(
                          image: AssetImage(this.imageUrl),
                          fit: BoxFit.fill,
                        ),
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
                      Row(
                        children: [
                          Text(
                            this.title,
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              this.description,
                              style: TextStyle(fontSize: 16),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 350,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                        child: Text(
                                      'Price: ' + this.price,
                                      textAlign: TextAlign.center,
                                    )),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          Scaffold.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(
                                                'Added ${this.title} for ${this.price} in the cart'),
                                            action: SnackBarAction(
                                              label: 'Undo',
                                              onPressed: () {},
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
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
