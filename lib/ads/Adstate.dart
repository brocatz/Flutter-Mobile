// This is a model class
// Not a StateFulWidget

import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdState {
  Future<InitializationStatus> initilization;

  AdState(this.initilization);

  String get bannerUnitId => Platform.isAndroid
      ? "ca-app-pub-3940256099942544/6300978111"
      : "ca-app-pub-3940256099942544/6300978111";
}
