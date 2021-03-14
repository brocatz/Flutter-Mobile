import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_form/models/RestaurantMenuItemModel.dart';

class CartNotifier with ChangeNotifier {
  final int minNumberOfSpecifiqueCartItem = 0;
  final int maxNumberOfSpecifiqueCartItem = 100;
  double _totalPriceOfCartItems = 0;
  LinkedHashMap<RestaurantMenuItemModel, int> _mapRestaurentMenuItems =
      new LinkedHashMap();

  // To initialise the iterable use the void setIterable()
  // ignore: unused_field
  Iterator<MapEntry<RestaurantMenuItemModel, int>> _iterable;
  Iterator<MapEntry<RestaurantMenuItemModel, int>> get iterable => _iterable;

  LinkedHashMap<RestaurantMenuItemModel, int> get mapRestaurentMenuItems =>
      _mapRestaurentMenuItems;

  double get totalPriceOfCartsItems =>
      _totalPriceOfCartItems; // asStringFixed(2)

  void addRestaurantMenuItemToCart(
      RestaurantMenuItemModel restaurantMenuItemModel) {
    // add the Resturanet Menu Item to the map
    if (_mapRestaurentMenuItems.containsKey(restaurantMenuItemModel)) {
      _mapRestaurentMenuItems.update(
          restaurantMenuItemModel,
          (value) =>
              (value == maxNumberOfSpecifiqueCartItem) ? value : ++value);
    } else {
      // Meaning that this is our first entry
      _mapRestaurentMenuItems.putIfAbsent(restaurantMenuItemModel, () => 1);
    }
    _totalPriceOfCartItems += restaurantMenuItemModel.price;

    notifyListeners();
  }

  // We set the SetIterable right we clicking the Cart Icon
  // So that we can get the Iterator from tge Map to display
  // what we choose
  void setIterable() {
    _iterable = mapRestaurentMenuItems.entries.iterator;
  }

  // Return the RestaurantMenuItemModel from Iterator
  // This has been modify to be a little more complex

  MapEntry<RestaurantMenuItemModel, int>
      getRestaurantMapEntryMenuItemFromIterator() {
    return _iterable.moveNext() ? iterable.current : null;
  }

  // Deletes the cart elements when the user confirms that they want
  // to empty the cart
  void deleteAllCartItems() {
    _mapRestaurentMenuItems.clear();
    notifyListeners();
  }

  void removeRestaurantMenuItemFromCart(
      RestaurantMenuItemModel restaurantMenuItemModel) {
    this._mapRestaurentMenuItems.update(restaurantMenuItemModel, (value) {
      // If the value is zero than don't decrement further
      // we do not want negative values
      return (value == minNumberOfSpecifiqueCartItem) ? value : --value;
    });

    if (_totalPriceOfCartItems != 0)
      _totalPriceOfCartItems -= restaurantMenuItemModel.price;

    notifyListeners();
  }

  void setTotalNumberOfSpecifiqueItem(
      RestaurantMenuItemModel restaurantMenuItemModel,
      int totalNumberOfSpecifiqueItem) {
    _mapRestaurentMenuItems.update(restaurantMenuItemModel,
        (value) => (value >= 100 && value < 0) ? value : 0);
    notifyListeners();
  }
}
