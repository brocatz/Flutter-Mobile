import 'package:flutter/material.dart';
import 'package:flutter_form/constant/ConstantTest.dart';
import 'package:flutter_form/widgets/discoverMenuItem.dart';

class HomePageView extends StatefulWidget {
  @override
  State<HomePageView> createState() => _HomePageViewSate();
}

class _HomePageViewSate extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(32, 32, 32, 0.5)),
      child: RefreshIndicator(
        onRefresh: () {
          // This is a test for now
          // This is suppose to fetch a network request
          return Future.delayed(Duration(seconds: 4));
        },
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
      ),
    );
  }
}
