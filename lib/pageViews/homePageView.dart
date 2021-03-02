import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          Container(
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
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(248, 237, 235, 0.5),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            )),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Crepes",
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold),
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
                                Text('Price'),
                                RaisedButton(
                                    child: Text('Add to cart'),
                                    onPressed: () {})
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
          )
        ],
      ),
    );
  }
}
