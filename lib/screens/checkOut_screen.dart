import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form/changeNotifier/checkOutNotifier.dart';
import 'package:flutter_form/constant/Constant.dart';
import 'package:flutter_form/pageViews/billingCreditCardInformation.dart';
import 'package:flutter_form/pageViews/billingShippingAddressPageView.dart';
import 'package:provider/provider.dart';

class CheckOutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CheckOutNotifier())],
      child: Consumer<CheckOutNotifier>(
        builder: (context, checkOutNotifier, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
            title: Text('Checkout'),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_sharp),
              onPressed: () {
                if (checkOutNotifier.getCurrentPageController.page != 0) {
                  checkOutNotifier.getCurrentPageController.animateToPage(0,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                } else {
                  Navigator.of(context).pop();
                }
              },
            ),
          ),
          body: GestureDetector(
            onTap: () {
              // FocusScopeNode currentNode = FocusScope.of(context);

              // if (!currentNode.hasPrimaryFocus) {
              //   currentNode.focusedChild?.unfocus();
              // }
            },
            child: PageView(
              controller: checkOutNotifier.getCurrentPageController,
              // physics: NeverScrollableScrollPhysics(),
              children: [
                BillingShippingAddress(checkOutNotifier: checkOutNotifier),
                BillingCreditCardInformation(
                    checkOutNotifier: checkOutNotifier),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget pageView() {
    return Consumer<CheckOutNotifier>(
      builder: (context, checkOutNotifier, child) => PageView(
        controller: checkOutNotifier.getCurrentPageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          BillingShippingAddress(checkOutNotifier: checkOutNotifier),
          BillingCreditCardInformation(checkOutNotifier: checkOutNotifier),
        ],
      ),
    );
  }

  Widget appBar() {
    return Consumer<CheckOutNotifier>(
      builder: (context, checkOutNotifier, child) => AppBar(
        backgroundColor: primaryColor,
        title: Text('Checkout'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp),
          onPressed: () {},
        ),
      ),
    );
  }
}
