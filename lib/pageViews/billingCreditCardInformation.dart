import 'package:credit_card/credit_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form/changeNotifier/checkOutNotifier.dart';
import 'package:flutter_form/constant/Constant.dart';
import 'package:provider/provider.dart';

class BillingCreditCardInformation extends StatefulWidget {
  final CheckOutNotifier checkOutNotifier;
  BillingCreditCardInformation({this.checkOutNotifier});

  @override
  _BillingCreditCardInformationState createState() =>
      _BillingCreditCardInformationState();
}

class _BillingCreditCardInformationState
    extends State<BillingCreditCardInformation> {
  // A ChangeNotifier

  final _key = GlobalKey<FormState>();

  final double identifierFieldWidth = 150.0;

  FocusNode _focusScope;

  String cardholderName = "";
  String cvv = "";
  String cardNumber = "";
  String expireDate = "";
  bool showCVVBack = false;
  @override
  void initState() {
    super.initState();
    _focusScope = new FocusNode();
    _focusScope.addListener(() {
      if (_focusScope.hasPrimaryFocus) {
        setState(() {
          showCVVBack = true;
        });
      } else {
        setState(() {
          showCVVBack = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckOutNotifier>(
      builder: (context, checkOutNotifier, child) => Container(
        decoration: BoxDecoration(color: backgroundColor),
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Form(
          key: _key,
          child: ListView(children: [
            Container(
              height: 585,
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
                SizedBox(height: 4),
                _buildCreditCardAnimation(checkOutNotifier),
                _buildCardHolderName(
                    identifierFieldWidth, checkOutNotifier, context),
                _buildCardNumber(identifierFieldWidth),
                _buildCVV(identifierFieldWidth),
                _buildExpiredDate(identifierFieldWidth),
                _buildSubmitButton(),
              ]),
            )
          ]),
        ),
      ),
    );
  }

  Widget _buildCreditCardAnimation(CheckOutNotifier checkOutNotifier) {
    return Row(
      children: [
        Expanded(
          child: CreditCardWidget(
            height: 225,
            cardNumber: cardNumber,
            expiryDate: expireDate,
            cardHolderName: cardholderName,
            cvvCode: cvv,
            showBackView:
                showCVVBack, //true when you want to show cvv(back) view
          ),
        ),
      ],
    );
  }

  Widget _buildCardHolderName(identifierFieldWidth,
      CheckOutNotifier checkOutNotifier, BuildContext context) {
    return Container(
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
                    width: identifierFieldWidth,
                    child: Text('Cardholder Name')),
                Container(
                  width: identifierFieldWidth,
                  child: TextFormField(
                    inputFormatters: [
                      // (\x20) is space
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[0-9a-zA-Z_(\x20)]'))
                    ],
                    onChanged: (value) {
                      // FocusScopeNode focusScope = FocusScope.of(context);
                      // CreditCardModel creditCardModel =
                      //     checkOutNotifier.creditCardModel;
                      // creditCardModel.cardholdername = value;
                      // checkOutNotifier.setState2(creditCardModel);
                      //focusScope.requestFocus();
                      setState(() {
                        cardholderName = value;
                      });
                    },
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
                    inputFormatters: [
                      TextInputFormatter.withFunction((oldValue, newValue) {
                        var text = newValue.text;
                        text = text.replaceAll(RegExp(r'(\s)|(\D)'), '');

                        int offset = newValue.selection.start;
                        var subText = newValue.text
                            .substring(0, offset)
                            .replaceAll(RegExp(r'(\s)|(\D)'), '');
                        int realTrimOffset = subText.length;

                        // if (newValue.selection.baseOffset == 0) {
                        //   return newValue;
                        // }

                        var buffer = new StringBuffer();
                        for (int i = 0; i < text.length; i++) {
                          buffer.write(text[i]);
                          var nonZeroIndex = i + 1;
                          if (nonZeroIndex % 4 == 0 &&
                              nonZeroIndex != text.length) {
                            buffer.write(
                                ' '); // Replace this with anything you want to put after each 4 numbers

                          }

                          // This block is only executed once
                          if (nonZeroIndex % 4 == 0 &&
                              subText.length == nonZeroIndex &&
                              nonZeroIndex > 4) {
                            int moveCursorToRigth = nonZeroIndex ~/ 4 - 1;
                            realTrimOffset += moveCursorToRigth;
                          }

                          // This block is only executed once
                          if (nonZeroIndex % 4 != 0 &&
                              subText.length == nonZeroIndex) {
                            int moveCursorToRigth = nonZeroIndex ~/ 4;
                            realTrimOffset += moveCursorToRigth;
                          }
                        }

                        var string = buffer.toString();
                        return newValue.copyWith(
                            text: string,
                            selection: new TextSelection.collapsed(
                              offset: realTrimOffset,
                            ));
                      })
                    ],
                    //maxLength: 19,
                    onChanged: (value) {
                      setState(() {
                        cardNumber = value;
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        counterText: "",
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
                    focusNode: _focusScope,
                    maxLength: 3,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'(\d)'))
                    ],
                    onChanged: (value) {
                      setState(() {
                        cvv = value;
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '000',
                        hintStyle: TextStyle(color: Colors.grey),
                        counterText: ""),
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
                    maxLength: 7,
                    inputFormatters: [
                      TextInputFormatter.withFunction((oldValue, newValue) {
                        // Make sure to sure a slash after
                        String text =
                            newValue.text.replaceAll(RegExp(r'(\D)'), '');

                        if (newValue.selection.baseOffset == 0) {
                          return newValue;
                        }

                        var buffer = new StringBuffer();

                        for (int i = 0; i < text.length; i++) {
                          buffer.write(text[i]);
                          // It's where we want to put the slash
                          if (i == 1 && i + 1 != text.length) {
                            buffer.write(' / ');
                          }
                        }

                        // More Filtering

                        var string = buffer.toString();
                        return newValue.copyWith(
                            text: string,
                            selection: new TextSelection.collapsed(
                                offset: string.length));
                      })
                    ],
                    //maxLength: 4,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        expireDate = value;
                      });
                    },
                    decoration: InputDecoration(
                        counterText: "",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: '01/20'),
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
              margin: EdgeInsets.only(top: 5),
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
}
