import 'package:flutter/material.dart';

class SearchPageView extends StatefulWidget {
  @override
  _SearchPageViewState createState() => _SearchPageViewState();
}

class _SearchPageViewState extends State<SearchPageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(32, 32, 32, 0.5)),
      child: Center(
        child: Text('Search'),
      ),
    ); // go to return something here
  }
}
