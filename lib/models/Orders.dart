import 'package:flutter_form/models/RestaurantMenuItemModel.dart';
import 'package:flutter_form/models/UserModel.dart';

class Orders {
  int confirmationNumber; // The Id;
  DateTime dateFoodOrder;

  List<RestaurantMenuItemModel> list;
  UserModel user;

  double totalPrice;
}
