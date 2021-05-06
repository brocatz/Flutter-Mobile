// Entry Point for the devSettings RealDevice Settings
import 'package:flutter_form/main.dart';
import 'package:flutter_form/ressources/app_config.dart';

void main() {
  var flavorConfig = FlavorConfig()
    ..apiEndPoints = {
      EndPoints.devEmulatedApiEndPoint: "10.0.2.2",
    };

  mainEntry(flavorConfig);
}
