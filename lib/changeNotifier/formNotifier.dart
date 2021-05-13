import 'package:flutter/cupertino.dart';

class FormNotifier with ChangeNotifier {
  // The controller that is Register ⇆ SignIn (Left to Rigth)
  PageController _controller1 = new PageController(initialPage: 0);
  // The controller that is RegisterPart1 and Register part2 ⇵ (Top to Bottom)
  PageController _controller2 = new PageController(initialPage: 0);

  PageController get getFormPageController2 => _controller2;
  PageController get getFormPageController1 => _controller1;

  void changeToRegisterPart2() {
    _controller2.animateToPage(1,
        duration: Duration(milliseconds: 950), curve: Curves.easeIn);
    notifyListeners();
  }

  Future<PageController> changeToRegisterPart1() async {
    return _controller2;
    // notifyListeners();
  }
}
