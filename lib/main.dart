import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_form/ads/Adstate.dart';
import 'package:flutter_form/changeNotifier/AdNotifier.dart';
import 'package:flutter_form/changeNotifier/cartNotifier.dart';
import 'package:flutter_form/changeNotifier/flavorConfigNotifier.dart';
import 'package:flutter_form/changeNotifier/formNotifier.dart';
import 'package:flutter_form/pageViews/registerAndSignInGlobalPageView.dart';
import 'package:flutter_form/ressources/app_config.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void mainEntry(FlavorConfig flavorConfig) {
  // Use this method when you want to run a plugin before
  // Ex : Firebase , Google Ads
  // the runApp() method
  WidgetsFlutterBinding.ensureInitialized();

  final initFuture = MobileAds.instance.initialize();
  //final adState = AdState(initFuture);

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(FormTutorial(
    flavorConfig: flavorConfig,
    //adState: adState,
  ));
}

class FormTutorial extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final FlavorConfig flavorConfig;
  final AdState adState;

  FormTutorial({this.flavorConfig, this.adState});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CartNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => FlavorConfigNotifier(flavorConfig),
        ),
        ChangeNotifierProvider(
          create: (_) => AdNotifier(adState: adState),
        ),
        ChangeNotifierProvider(
          create: (_) => FormNotifier(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Form Tutorial',
          home: Scaffold(
            /* appBar: AppBar(
              backgroundColor: Colors.teal,
              centerTitle: true,
              title: Text('Form Tutorial'),
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
              ),
            ), */
            body: FutureBuilder(
              future: Future.delayed(Duration(seconds: 3), () {
                //throw ('Custom Error');
                return _initialization;
              }),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print('Error my boi');
                  return Text('Error'); // a widget showing some kind of error
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return GestureDetector(
                      onTap: () {
                        FocusScopeNode currentNode = FocusScope.of(context);
                        if (!currentNode.hasPrimaryFocus) {
                          currentNode.unfocus();
                        }
                      },
                      child: RegisterAndSignInGlobalPageView());
                } else {
                  //return Center(child: CircularProgressIndicator());
                }

                // return Center(
                //   child: CircularProgressIndicator(
                //     strokeWidth: 20,
                //     backgroundColor: Colors.red,
                //   ),
                // );
                return Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(32, 32, 32, 0.9)),
                  child: Container(
                    child: SpinKitFadingCircle(
                      color: Colors.blueGrey[50],
                      size: 55,
                    ),
                  ),
                );
              },
            ),
          )),
    );
  }
}
