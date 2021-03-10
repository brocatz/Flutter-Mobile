import 'package:flutter/material.dart';
import 'package:flutter_form/constant/Constant.dart';

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        // color: Colors.red,
        width: 125,
        height: 75,
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: primaryColor,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.arrow_left,
                  size: 40,
                ),
                onPressed: () {},
              ),
            ),
            Container(
              width: 40,
              child: TextField(
                style: TextStyle(),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                controller: TextEditingController(text: '0'),
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            CircleAvatar(
              backgroundColor: primaryColor,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.arrow_right,
                  size: 40,
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      );
}
