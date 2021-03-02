import 'package:flutter/material.dart';

class DiscoverMenuItem extends StatelessWidget {
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
                        image: AssetImage('assets/images/crepe.jpg'),
                        fit: BoxFit.fill,
                      ),
                    )),
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
                            "Crepes",
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Description',
                            style: TextStyle(fontSize: 16),
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
                                      'Price : 80\$',
                                      textAlign: TextAlign.center,
                                    )),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {},
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