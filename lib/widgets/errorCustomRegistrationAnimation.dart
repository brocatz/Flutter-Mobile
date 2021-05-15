import 'package:flutter/material.dart';

Widget buildCustomErrorWidgetOfType(
    String errorMessage, bool isErrorOfTypeActive) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      AnimatedContainer(
        height: isErrorOfTypeActive ? 22 : 0,
        constraints: BoxConstraints(minHeight: 0, maxHeight: 22),
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 500),
        margin: EdgeInsets.only(top: 2.8),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1 / 2),
        decoration: BoxDecoration(
            color: isErrorOfTypeActive
                ? Color(0xFFbd1f36)
                : Colors.transparent, //Color(0xFFa01a58),
            border: Border.all(style: BorderStyle.none),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(
                color: isErrorOfTypeActive ? Colors.white : Colors.transparent),
            children: <InlineSpan>[
              WidgetSpan(
                  child: Icon(
                Icons.priority_high,
                color: isErrorOfTypeActive ? Colors.white : Colors.transparent,
                size: 16,
              )),
              TextSpan(text: '$errorMessage'),
              WidgetSpan(
                child: Icon(
                  Icons.priority_high,
                  color:
                      isErrorOfTypeActive ? Colors.white : Colors.transparent,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
