import 'dart:convert';
import 'dart:typed_data';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form/changeNotifier/cartNotifier.dart';
import 'package:flutter_form/changeNotifier/flavorConfigNotifier.dart';
import 'package:flutter_form/constant/Constant.dart';
import 'package:flutter_form/ressources/app_config.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

class PayPalInAppWebView extends StatefulWidget {
  @override
  _PayPalInAppWebViewState createState() => _PayPalInAppWebViewState();
}

class _PayPalInAppWebViewState extends State<PayPalInAppWebView> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<CartNotifier, FlavorConfigNotifier>(
      builder: (context, cartNotifer, flavorConfigNotifier, child) => Scaffold(
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
            // print("\n  ${cartNotifer.postSelectedItemToServer()}");
            // print('PRint data');
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
            url: flavorConfigNotifier
                .flavorConfig.apiUriEndPoints[EndPoints.devEmulatedApiEndPoint]
            /*Uri.http(
              '10.0.2.2:5001',
              '/api/pay' ,
            )*/
            ,
            // headers: <String, String>{"Content-Type": "application/json"},
            method: 'POST',
            // The data is en coded as a map to query string to Uint8List
            // The serve will deserialize the data
            body: Uint8List.fromList(
              utf8.encode(
                cartNotifer.encoding(),
              ),
            ),
          ),
          onLoadStart: (controller, url) {
            // nothing is happening
          },
          onLoadStop: (InAppWebViewController controller, Uri uri) async {
            if (uri.path == '/checkoutnow') {
              // Removes the alert dialogue
              Navigator.pop(context);
            }

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
