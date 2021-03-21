import 'package:awesome_card/awesome_card.dart';
import 'package:awesome_card/credit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form/changeNotifier/checkOutNotifier.dart';
import 'package:flutter_form/constant/Constant.dart';

class BillingCreditCardInformation extends StatelessWidget {
  // A ChangeNotifier
  final CheckOutNotifier checkOutNotifier;
  final _key = GlobalKey<FormState>();

  final double identifierFieldWidth = 150.0;

  BillingCreditCardInformation({this.checkOutNotifier});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: backgroundColor),
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Form(
        key: _key,
        child: ListView(children: [
          Container(
            height: 575,
            width: 350,
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
                        'Credit Card Information',
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
              // Row(
              //   children: [
              //     Expanded(
              //       child: Container(
              //         color: Colors.red,
              //         height: 30,
              //         child:
              //             Center(child: Text('Review and Submit Your Order')),
              //       ),
              //     )
              //   ],
              // ),
              // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              //   Text(
              //     'Credit Card Information',
              //     style: TextStyle(fontWeight: FontWeight.bold),
              //   ),
              // ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ToggleButtons(children: <Widget>[
                  //   Container(
                  //     width: 50,
                  //     height: 50,
                  //     decoration: BoxDecoration(
                  //         image: DecorationImage(
                  //             image: AssetImage(
                  //                 'assets/images/icon/icons8-visa-400.png'))),
                  //   ),
                  //   Container(),
                  //   Container()
                  // ], isSelected: [
                  //   false,
                  //   true,
                  //   true
                  // ])
                ],
              ),
              SizedBox(height: 10),
              _buildCreditCardAnimation(),
              _buildCardHolderName(identifierFieldWidth),
              _buildCardNumber(identifierFieldWidth),
              _buildCVV(identifierFieldWidth),
              _buildExpiredDate(identifierFieldWidth),
              _buildSubmitButton(),
            ]),
          )
        ]),
      ),
    );
  }
}

Widget _buildCreditCardAnimation() {
  return Row(
    children: [
      Expanded(
        child: CreditCard(
          cardNumber: '2323',
          cardExpiry: '23232',
          cardHolderName: 'frf',
          cvv: 'rtrtr',
          bankName: "Axis Bank",
          showBackSide: false,
          frontBackground: CardBackgrounds.black,
          backBackground: CardBackgrounds.white,
          showShadow: true,
        ),
      ),
    ],
  );
}

Widget _buildCardHolderName(identifierFieldWidth) {
  return Container(
    margin: EdgeInsets.only(top: 10),
    padding: EdgeInsets.only(left: 20, right: 20),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              color: Color(0xFFe5e5e5),
              border:
                  Border.all(width: 1, color: Color.fromRGBO(32, 32, 32, .5))),
          child: Row(
            children: [
              Container(
                  width: identifierFieldWidth, child: Text('Cardholder Name')),
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
}

Widget _buildCardNumber(identifierFieldWidth) {
  return Container(
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
                  right: BorderSide(color: Color.fromRGBO(32, 32, 32, .5)))),
          child: Row(
            children: [
              Container(
                  width: identifierFieldWidth, child: Text('Card Number')),
              Container(
                width: identifierFieldWidth,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '4720 0000 0000 0000',
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildCVV(identifierFieldWidth) {
  return Container(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              color: Color(0xFFe5e5e5),
              border: Border(
                  left: BorderSide(
                      color: Color.fromRGBO(32, 32, 32, .5), width: 1.0),
                  right: BorderSide(color: Color.fromRGBO(32, 32, 32, .5)))),
          child: Row(
            children: [
              Container(width: identifierFieldWidth, child: Text('CVV')),
              Container(
                width: identifierFieldWidth,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '000',
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildExpiredDate(identifierFieldWidth) {
  return Container(
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
                  width: identifierFieldWidth, child: Text('Expired Date')),
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
}

Widget _buildSubmitButton() => Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              child: Text('Purchased'),
              onPressed: () {
                // Purchase Items
              },
            ),
          ),
        )
      ],
    );
