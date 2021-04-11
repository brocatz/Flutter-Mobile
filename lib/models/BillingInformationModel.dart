import 'package:flutter_form/models/CreditCardModel.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'BillingInformationModel.g.dart';

@JsonSerializable()
class BillingInformationModel {
  String firstName;
  String lastName;
  String emailAddress;
  String city; //
  String streetAddress;
  String appartSuiteNumber;
  String country;
  String postalCode;
  String primaryPhoneNumber;
  String secondDaryPhoneNumber;

  CreditCardModel creditCardModel;

  // factory BillingInformationModel.fromJson(Map<String, dynamic> json) =>
  //     _$BillingInformationModelFromJson(json);

  // Map<String, dynamic> toJson() => _$BillingInformationModelToJson(this);
}
