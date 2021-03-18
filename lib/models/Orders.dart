import 'dart:collection';

import 'package:flutter_form/models/RestaurantMenuItemModel.dart';
import 'package:flutter_form/models/UserModel.dart';

// This class is an intermediate class Between User and FoodItems
class Orders {
  int confirmationNumber; // The Id;
  DateTime dateFoodOrder;

  LinkedHashMap<RestaurantMenuItemModel, int> listItemOrder;
  UserModel user;
}
