import 'package:flutter/cupertino.dart';
import 'package:flutter_form/ads/Adstate.dart';

class AdNotifier with ChangeNotifier {
  AdState adState;

  AdNotifier({this.adState});
  AdState get adstate => adState;
}
