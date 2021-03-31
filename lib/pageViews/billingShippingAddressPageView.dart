import 'package:flutter/material.dart';
import 'package:flutter_form/changeNotifier/checkOutNotifier.dart';
import 'package:flutter_form/constant/Constant.dart';

class BillingShippingAddress extends StatelessWidget {
  final CheckOutNotifier checkOutNotifier;

  BillingShippingAddress({this.checkOutNotifier});

  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<FormState>();

    const identifierFieldWidth = 150.0;
    return Container(
      decoration: BoxDecoration(color: backgroundColor),
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Form(
        key: _key,
        child: ListView(children: [
          Container(
            height: 500,
            width: 300,
            decoration: BoxDecoration(
                color: Color(0xFFB0A8B9),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Column(
              children: [
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
                        child:
                            Center(child: Text('Review and Submit Your Order')),
                      ),
                    )
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'Shipping Adress',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ]),
                _buildFirstName(identifierFieldWidth),
                _buildLastName(identifierFieldWidth),
                _buildStreet(identifierFieldWidth),
                _buildAppNumberSuite(identifierFieldWidth),
                _buildCity(identifierFieldWidth),
                _buildPostalCode(identifierFieldWidth),
                _buildSubmitButton(),
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget _buildFirstName(identifierFieldWidth) => Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  color: Color(0xFFe5e5e5),
                  border: Border.all(
                      width: 1, color: Color.fromRGBO(32, 32, 32, .5))),
              child: Row(
                children: [
                  Container(
                      width: identifierFieldWidth, child: Text('First Name')),
                  Container(
                    width: identifierFieldWidth,
                    child: TextFormField(
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'John',
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
  Widget _buildLastName(identifierFieldWidth) => Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  color: Color(0xFFe5e5e5),
                  border: Border(
                      bottom: BorderSide(
                          color: Color.fromRGBO(32, 32, 32, .5), width: 1.0),
                      left: BorderSide(
                          color: Color.fromRGBO(32, 32, 32, .5), width: 1.0),
                      right:
                          BorderSide(color: Color.fromRGBO(32, 32, 32, .5)))),
              child: Row(
                children: [
                  Container(
                      width: identifierFieldWidth, child: Text('Last Name')),
                  Container(
                    width: identifierFieldWidth,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Doe',
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  Widget _buildStreet(identifierFieldWidth) => Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  color: Color(0xFFe5e5e5),
                  border: Border(
                      bottom: BorderSide(color: Color.fromRGBO(32, 32, 32, .5)),
                      left: BorderSide(
                        color: Color.fromRGBO(32, 32, 32, .5),
                      ),
                      right: BorderSide(
                          color: Color.fromRGBO(32, 32, 32, .5), width: 1.0))),
              child: Row(
                children: [
                  Container(
                    width: identifierFieldWidth,
                    child: Text('Street'),
                  ),
                  Container(
                    width: identifierFieldWidth,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: '123 Avenue Street ...',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  Widget _buildAppNumberSuite(identifierFieldWidth) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFFe5e5e5),
                  border: Border(
                      bottom: BorderSide(color: Color.fromRGBO(32, 32, 32, .5)),
                      left: BorderSide(
                        color: Color.fromRGBO(32, 32, 32, .5),
                      ),
                      right: BorderSide(
                          color: Color.fromRGBO(32, 32, 32, .5), width: 1.0))),
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Row(children: [
                Container(
                  width: identifierFieldWidth,
                  child: Text('Apt, suite etc\.'),
                ),
                Container(
                  width: identifierFieldWidth,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Suite #100',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                )
              ]),
            ),
          ],
        ),
      );
  Widget _buildCity(identifierFieldWidth) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  color: Color(0xFFe5e5e5),
                  border: Border(
                      left: BorderSide(
                        color: Color.fromRGBO(32, 32, 32, .5),
                      ),
                      right: BorderSide(
                          color: Color.fromRGBO(32, 32, 32, .5), width: 1.0))),
              child: Row(
                children: [
                  Container(width: identifierFieldWidth, child: Text('City')),
                  Container(
                    width: identifierFieldWidth,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Montreal',
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
  Widget _buildPostalCode(identifierFieldWidth) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  color: Color(0xFFe5e5e5),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  border: Border.all(
                      width: 1.0, color: Color.fromRGBO(32, 32, 32, .5))),
              child: Row(
                children: [
                  Container(
                      width: identifierFieldWidth, child: Text('Postal  Code')),
                  Container(
                    width: identifierFieldWidth,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: 'H4N H4N'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
  Widget _buildSubmitButton() => Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                child: Text('Proceed to credit card info'),
                onPressed: () {
                  checkOutNotifier.getCurrentPageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                },
              ),
            ),
          )
        ],
      );
}
