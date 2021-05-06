import 'package:flutter/cupertino.dart';
import 'package:flutter_form/ressources/app_config.dart';

// Will hold the application configuration pass at runTime;
class FlavorConfigNotifier with ChangeNotifier {
  FlavorConfig flavorConfig;
  FlavorConfigNotifier(this.flavorConfig);
}
