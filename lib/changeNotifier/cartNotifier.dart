import 'package:flutter/cupertino.dart';
import 'package:flutter_form/models/RestaurantMenuItemModel.dart';

class CartNotifier with ChangeNotifier {
  List<RestaurantMenuItemModel> _listRestaurentMenuItems = [];

  Map<RestaurantMenuItemModel, int> _mapRestaurentMenuItems = new Map();

  List<RestaurantMenuItemModel> get listRestaurentMenuItem =>
      _listRestaurentMenuItems;

  void addRestaurantMenuItemToCart(
      RestaurantMenuItemModel restaurantMenuItemModel) {
    _listRestaurentMenuItems.add(restaurantMenuItemModel);
    notifyListeners();
  }

  void removeRestaurantMenuItemFromCart(
      RestaurantMenuItemModel restaurantMenuItemModel) {
    _listRestaurentMenuItems.remove(restaurantMenuItemModel);
  }
}
