import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form/widgets/discoverMenuItem.dart';

class HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(32, 32, 32, 0.5)),
      child: ListView(
        padding: EdgeInsets.only(
          top: 10,
          left: 20,
          right: 20,
        ),
        children: <Widget>[
          DiscoverMenuItem(
            imageUrl: 'assets/images/crepe.jpg',
            title: 'Crepes',
            price: '24.56\$',
            description:
                'Crepes made from France with a delicious taste that will melt your mouth',
          ),
          SizedBox(height: 5),
          DiscoverMenuItem(
            imageUrl: 'assets/images/ramen.jpeg',
            title: 'Ramen',
            price: '32.23\$',
            description: 'Japanese style ramen',
          ),
          SizedBox(height: 5),
          DiscoverMenuItem(
            imageUrl: 'assets/images/salade.jpeg',
            title: 'Salad',
            price: '45.34\$',
            description:
                'Healty salad compose of a lot of fruits and vegetable',
          ),
          SizedBox(height: 5),
          DiscoverMenuItem(
            imageUrl: 'assets/images/pumpkin.jpg',
            title: 'Pumpkin Soup',
            price: '19.43\$',
            description: 'A healty soup that will boost your immunitive system',
          ),
        ],
      ),
    );
  }
}
