import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_form/models/RestaurantMenuItemModel.dart';

class CartNotifier with ChangeNotifier {
  // List<RestaurantMenuItemModel> _listRestaurentMenuItems = [];

  LinkedHashMap<RestaurantMenuItemModel, int> _mapRestaurentMenuItems =
      new LinkedHashMap();

  // To initialise the iterable use the void setIterable()
  // ignore: unused_field
  Iterator<RestaurantMenuItemModel> _iterable;

  Iterator<RestaurantMenuItemModel> get iterable => _iterable;

  // List<RestaurantMenuItemModel> get listRestaurentMenuItem =>
  //     _listRestaurentMenuItems;
  LinkedHashMap<RestaurantMenuItemModel, int> get mapRestaurentMenuItems =>
      _mapRestaurentMenuItems;

  void addRestaurantMenuItemToCart(
      RestaurantMenuItemModel restaurantMenuItemModel) {
    // add the Resturanet Menu Item to the map
    if (_mapRestaurentMenuItems.containsKey(restaurantMenuItemModel)) {
      _mapRestaurentMenuItems.update(
          restaurantMenuItemModel, (value) => ++value);
    } else {
      // Meaning that this is our first entry
      _mapRestaurentMenuItems.putIfAbsent(restaurantMenuItemModel, () => 1);
    }
    // _listRestaurentMenuItems.add(restaurantMenuItemModel);
    notifyListeners();
  }

  void removeRestaurantMenuItemFromCart(
      RestaurantMenuItemModel restaurantMenuItemModel) {
    // remove the restaurent menu item
    // _listRestaurentMenuItems.remove(restaurantMenuItemModel);
    _mapRestaurentMenuItems.update(restaurantMenuItemModel, (value) => --value);
  }

  void setIterable() {
    _iterable = mapRestaurentMenuItems.keys.iterator;
  }

  RestaurantMenuItemModel getRestaurantMenuItemFromIterator() {
    return _iterable.moveNext() ? iterable.current : null;
  }
}
