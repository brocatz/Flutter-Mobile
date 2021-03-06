import 'package:flutter/material.dart';
import 'package:flutter_form/constant/Constant.dart';

class RestaurantItemDetailScreen extends StatefulWidget {
  @override
  _RestaurantItemDetailState createState() => _RestaurantItemDetailState();
}

class _RestaurantItemDetailState extends State<RestaurantItemDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items Detail'),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: backgroundColor),
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/crepe.jpg'))),
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
