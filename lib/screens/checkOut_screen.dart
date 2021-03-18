import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form/constant/Constant.dart';

class CheckOutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<FormState>();

    const identifierFieldWidth = 150.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Checkout'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(color: backgroundColor),
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Form(
          key: _key,
          child: ListView(
            children: [
              Container(
                height: 500,
                width: 300,
                decoration: BoxDecoration(
                    color: Color(0xFFB0A8B9),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Column(children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              )),
                          height: 50,
                          child: Center(
                              child: Text(
                            'Billing Information',
                            style: TextStyle(
                              color: Color(0xFFf1dca7),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.red,
                          height: 30,
                          child: Center(
                              child: Text('Review and Submit Your Order')),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Shipping Adress',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      // InkWell(
                      //   onTap: () {},
                      //   child: Text(
                      //     'Change Adresss',
                      //     style: TextStyle(
                      //         color: Colors.blue[800],
                      //         decoration: TextDecoration.underline),
                      //   ),
                      // )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          width: identifierFieldWidth,
                          child: Text('First Name')),
                      Container(
                        width: identifierFieldWidth,
                        child: TextFormField(
                          initialValue: 'sd',
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          width: identifierFieldWidth,
                          child: Text('Last Name')),
                      Container(
                        width: identifierFieldWidth,
                        child: TextFormField(),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: identifierFieldWidth,
                        child: Text('Street'),
                      ),
                      Container(
                        width: identifierFieldWidth,
                        child: TextFormField(),
                      ),
                    ],
                  ),
                  Row(children: [
                    Container(
                      width: identifierFieldWidth,
                      child: Text('Apt, suite etc\.'),
                    ),
                    Container(
                      width: identifierFieldWidth,
                      child: TextFormField(),
                    )
                  ]),
                  Row(
                    children: [
                      Container(
                          width: identifierFieldWidth, child: Text('City')),
                      Container(
                        width: identifierFieldWidth,
                        child: TextFormField(),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          width: identifierFieldWidth, child: Text('PostCode')),
                      Container(
                        width: identifierFieldWidth,
                        child: TextFormField(),
                      )
                    ],
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black)),
          child: Text(
            'Buy: 1200.34\$',
            style: TextStyle(
                backgroundColor: Colors.black, color: Color(0xFFf1dca7)),
          ),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
