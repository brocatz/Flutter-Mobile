import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form/changeNotifier/cartNotifier.dart';
import 'package:flutter_form/constant/Constant.dart';
import 'package:flutter_form/models/CreditCardModel.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

class PayPalInAppWebView extends StatefulWidget {
  @override
  _PayPalInAppWebViewState createState() => _PayPalInAppWebViewState();
}

class _PayPalInAppWebViewState extends State<PayPalInAppWebView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartNotifier>(
      builder: (context, cartNotifer, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text('Checkout'),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // Migth not work
                Navigator.pop(context);
              }),
        ),
        body: InAppWebView(
          onWebViewCreated: (InAppWebViewController c) {
            // _controller.complete(c);
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  var fadeAnimateTextStyle = TextStyle(
                    fontSize: 20,
                  );
                  return AlertDialog(
                    title: Center(
                      child: Text('Please wait ...'),
                    ),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: [
                          Container(
                            height: 40,
                            child: Row(
                              children: [
                                CircularProgressIndicator(strokeWidth: 10),
                                SizedBox(width: 40),
                                AnimatedTextKit(
                                  pause: Duration(milliseconds: 50),
                                  repeatForever: true,
                                  animatedTexts: [
                                    FadeAnimatedText('Loading .',
                                        textStyle: fadeAnimateTextStyle),
                                    FadeAnimatedText('Loading ..',
                                        textStyle: fadeAnimateTextStyle),
                                    FadeAnimatedText('Loading ...',
                                        textStyle: fadeAnimateTextStyle),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
          initialUrlRequest: URLRequest(
            url: Uri.http('10.0.2.2:5001', '/api/pay'),
            headers: <String, String>{"Content-Type": "application/json"},
            method: 'POST',
            // Pass List Data to show
            // We will need to continue this to pass data to our server
            body: Uint8List.fromList(
              utf8.encode(jsonDecode('sdsd')),
            ),
          ),
          onLoadStart: (controller, url) {
            // nothing is happening
          },
          onLoadStop: (InAppWebViewController controller, Uri uri) async {
            var urv = await controller.getUrl();
            if (uri.path == '/checkoutnow') {
              // Removes the alert dialogue
              Navigator.pop(context);
            }
            print(urv.data);
            log(urv.data.toString());
            debugPrint(urv.data.toString());
            debugPrint(uri.path);

            if (uri.path == '/cancelv2') {
              //cancel the request and show a widget
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        title: Center(
                            child: Row(
                          children: [
                            Text('Transaction Cancel'),
                            // We want to create a countdown timer
                          ],
                        )),
                        content: SingleChildScrollView(
                          child: ListBody(children: [
                            Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 20,
                                backgroundColor: Colors.red[500],
                              ),
                            ),
                          ]),
                        ));
                  });
            }
          },
        ),
      ),
    );
  }
}
