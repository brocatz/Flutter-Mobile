// For now , we will not be using the production mode
import 'package:flutter_form/main.dart';
import 'package:flutter_form/ressources/app_config.dart';

void main() {
  FlavorConfig flavorConfig = FlavorConfig()
    ..apiUriEndPoints = {
      EndPoints.devRealDeviceEndPoint: Uri.https("192.168.2.1", "/api/pay"),
    };

  mainEntry(flavorConfig);
}
