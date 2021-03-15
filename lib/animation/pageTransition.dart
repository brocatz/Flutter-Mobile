import 'package:flutter/cupertino.dart';
import 'package:flutter_form/screens/checkOut_screen.dart';

Route createRouteFromCartScreenToCheckOutScreen() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => CheckOutScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset(0.0, 0.0);

        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      });
}
