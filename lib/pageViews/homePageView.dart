import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 10),
      children: <Widget>[
        Column(
          children: [
            Row(
              children: [
                Expanded(child: Image.asset('assets/images/crepe.jpg')),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      color: Colors.green,
                      child: Text(
                        'Crepe Francaise',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Crepe Francaise',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
