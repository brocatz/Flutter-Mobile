import 'package:flutter_form/models/RestaurantMenuItemModel.dart';

///////////////////////////////
/// A Class for dummy test ///
/////////////////////////////

List<RestaurantMenuItemModel> foodList = [
  RestaurantMenuItemModel(
    imageUrl: 'assets/images/crepe.jpg',
    title: 'Crepes',
    price: 24.56,
    description:
        'Crepes made from France with a delicious taste that will melt your mouth',
  ),
  RestaurantMenuItemModel(
    imageUrl: 'assets/images/ramen.jpeg',
    title: 'Ramen',
    price: 32.23,
    description: 'Japanese style ramen',
  ),
  RestaurantMenuItemModel(
    imageUrl: 'assets/images/salade.jpeg',
    title: 'Salad',
    price: 45.34,
    description: 'Healty salad compose of a lot of fruits and vegetable',
  ),
  RestaurantMenuItemModel(
    imageUrl: 'assets/images/pumpkin.jpg',
    title: 'Pumpkin Soup',
    price: 19.43,
    description: 'A healty soup that will boost your immunitive system',
  )
];
