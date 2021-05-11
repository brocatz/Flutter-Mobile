////////////////////////////////////////////////////////////////////////////////
//                        SETTING FOR                                         //
//                       EMULATED DEVICE                                      //
////////////////////////////////////////////////////////////////////////////////

import 'package:flutter_form/main.dart';
import 'package:flutter_form/ressources/app_config.dart';

void main() {
  var flavorConfig = FlavorConfig()
    ..apiEndPoints = {EndPoints.devEmulatedApiEndPoint: "10.0.2.2"}
    ..apiUriEndPoints = {
      EndPoints.devEmulatedApiEndPoint: Uri.http("10.0.2.2:5001", "/api/pay")
    };

  // The flavorConfig with be
  mainEntry(flavorConfig);
}
