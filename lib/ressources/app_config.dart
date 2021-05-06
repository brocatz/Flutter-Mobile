enum EndPoints { devEmulatedApiEndPoint, devRealDeviceEndPoint }

class FlavorConfig {
  String appTitle;
  Map<EndPoints, String> apiEndPoints;

  FlavorConfig();
}
