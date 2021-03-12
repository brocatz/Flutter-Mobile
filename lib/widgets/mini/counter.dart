import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form/constant/Constant.dart';

class Counter extends StatelessWidget {
  final int quantity;

  Counter({
    @required this.quantity,
  });

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
                  color: Colors.red,
                  size: 40,
                ),
                onPressed: () {},
              ),
            ),
            Container(
              width: 40,
              child: TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(2),
                  FilteringTextInputFormatter(RegExp(r'^[0-9]+$'),
                      allow: true, replacementString: ''),
                ],
                style: TextStyle(),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                controller:
                    TextEditingController(text: this.quantity.toString()),
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
                  color: Colors.green,
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      );
}