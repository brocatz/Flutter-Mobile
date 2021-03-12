import 'package:flutter/material.dart';
import 'package:flutter_form/constant/ConstantTest.dart';
import 'package:flutter_form/widgets/discoverMenuItem.dart';

class HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(32, 32, 32, 0.5)),
      child: ListView.builder(
        padding: EdgeInsets.only(
          top: 10,
          left: 20,
          right: 20,
        ),
        itemCount: foodList.length,
        itemBuilder: (context, index) {
          return DiscoverMenuItem(
            restaurantMenuItemModel: foodList[index],
          );
        },
      ),
    );
  }
}
