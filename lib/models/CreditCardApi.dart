import 'dart:convert';
import 'package:flutter_form/models/CreditCardModel.dart';

import 'package:http/http.dart' as http;

class CreditCardApi {
  static Future<http.Response> sendCreditCardInformation(
      CreditCardModel billingInformationModel) async {
    var reponse = await http.post(Uri.http('10.0.2.2:5000', '/api/flutter/'),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode(billingInformationModel));

    return reponse;
  }
}
