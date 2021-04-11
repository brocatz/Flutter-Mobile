import 'package:flutter/cupertino.dart';
import 'package:flutter_form/models/CreditCardModel.dart';

class CheckOutNotifier with ChangeNotifier {
  int currentPage = 0;
  final PageController _controller = PageController(initialPage: 0);

  PageController get getCurrentPageController => _controller;
  // CreditCardModel creditCardModel = CreditCardModel(
  //   cardNumber: '',
  //   cardholdername: '',
  //   cvv: '',
  //   expireDate: '',
  // );

  // void setState2(CreditCardModel creditCardModel) {
  //   this.creditCardModel = creditCardModel;
  //   notifyListeners();
  // }
}
