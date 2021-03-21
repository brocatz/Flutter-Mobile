import 'package:flutter/cupertino.dart';

class CheckOutNotifier with ChangeNotifier {
  int currentPage = 0;
  final PageController _controller = PageController(initialPage: 0);

  PageController get getCurrentPageController => _controller;
}
