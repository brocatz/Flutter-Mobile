import 'package:flutter/material.dart';
// import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_form/changeNotifier/cartNotifier.dart';
import 'package:flutter_form/pageViews/register_screen.dart';
import 'package:flutter_form/pageViews/signIn_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(FormTutorial());
}

class FormTutorial extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CartNotifier(),
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
              future: Future.delayed(Duration(seconds: 1), () {
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
                      child: pageView());
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

  Widget pageView() {
    final controller = PageController(
      initialPage: 0,
    );

    return PageView(
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: <Widget>[_application(RegisterForm()), _application(SignIn())],
    );
  }

  Widget _application(Widget customForm) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFF1d2d44)),
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF618985),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              )
            ],
          ),
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.only(/*top: 20 , */ left: 10, right: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: customForm,
          ),
        ),
      ),
    );
  }
}
