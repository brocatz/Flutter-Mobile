import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_form/models/RestaurantMenuItemModel.dart';

class CartNotifier with ChangeNotifier {
  final int minNumberOfSpecifiqueCartItem = 0;
  final int maxNumberOfSpecifiqueCartItem = 100;
  double _totalPriceOfCartItems = 0;
  int _totalNumberOfSelectedItems = 0;
  bool _showBagdeNotification = false; // False at first
  // then when we start to add items to cart show
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

  int get totalNumberOfSelectedItems => _totalNumberOfSelectedItems;

  bool get showBadgeNotification => _showBagdeNotification;

  void addRestaurantMenuItemToCart(
      RestaurantMenuItemModel restaurantMenuItemModel) {
    // add the Resturanet Menu Item to the map
    if (_mapRestaurentMenuItems.containsKey(restaurantMenuItemModel)) {
      _mapRestaurentMenuItems.update(
          restaurantMenuItemModel,
          (value) =>
              (value == maxNumberOfSpecifiqueCartItem) ? value : ++value);
    } else {
      // Meaning that this is our first entry of a specifque Food item
      _showBagdeNotification = true;
      _mapRestaurentMenuItems.putIfAbsent(restaurantMenuItemModel, () => 1);
    }
    _totalPriceOfCartItems += restaurantMenuItemModel.price;
    _totalNumberOfSelectedItems++;
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
    _totalPriceOfCartItems = 0;
    _totalNumberOfSelectedItems = 0;
    _showBagdeNotification = false;
    notifyListeners();
  }

  // If item has zero value stop from being able to substract
  void removeRestaurantMenuItemFromCart(
      RestaurantMenuItemModel restaurantMenuItemModel) {
    this._mapRestaurentMenuItems.update(restaurantMenuItemModel, (value) {
      // If the value is zero than don't decrement further
      // we do not want negative values

      if (value > minNumberOfSpecifiqueCartItem) {
        _totalNumberOfSelectedItems--;
        _totalPriceOfCartItems -= restaurantMenuItemModel.price;
      }

      int valueToReturn =
          (value == minNumberOfSpecifiqueCartItem) ? value : --value;

      return valueToReturn;
    });

    notifyListeners();
  }

  void setTotalNumberOfSpecifiqueItem(
      RestaurantMenuItemModel restaurantMenuItemModel,
      int totalNumberOfSpecifiqueItem) {
    _mapRestaurentMenuItems.update(
        restaurantMenuItemModel,
        (value) => (value >= maxNumberOfSpecifiqueCartItem &&
                value < minNumberOfSpecifiqueCartItem)
            ? 0 // We don t want a negative order of items and too many orders
            : value);
    notifyListeners();
  }
}
