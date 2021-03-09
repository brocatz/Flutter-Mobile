import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form/constant/Constant.dart';

import 'home_screen.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();

  bool isPasswordObsure = true;

  String emailAdress;
  String password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          SizedBox(height: 120),
          _buildTitle(),
          SizedBox(height: 15),
          _buildEmail(),
          SizedBox(height: 15),
          _buildPassword(),
          SizedBox(height: 15),
          _buildSubmit(),
          SizedBox(height: 60)
        ],
      ),
    );
  }

  Widget _buildTitle() {
    // does not do anything yet
    return Text('Login',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30.0,
        ));
  }

  Widget _buildEmail() {
    return TextFormField(
      initialValue: initialEmailAdress,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFdee2ff),
          hintText: 'Enter email',
          prefixIcon: Icon(Icons.mail_rounded),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none)),
      validator: (value) {
        return null;
      },
      onSaved: (value) {
        emailAdress = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      initialValue: initialPassword,
      obscureText: isPasswordObsure,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFdee2ff),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide.none,
        ),
        hintText: 'Enter Password',
        prefixIcon: Icon(Icons.lock_rounded),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordObsure ? Icons.visibility_off : Icons.visibility,
            color: isPasswordObsure ? Colors.blueGrey : Colors.blue,
          ),
          onPressed: () {
            setState(() {
              isPasswordObsure = !isPasswordObsure;
            });
          },
        ),
      ),
      validator: (value) {
        return null;
      },
      onSaved: (value) {
        password = value;
      },
    );
  }

  Widget _buildSubmit() {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(formButtonColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))))),
      child: Text(
        'Login',
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
      onPressed: () async {
        // Make sure that all the fields are validated proprely
        if (!_formKey.currentState.validate()) {
          print('Errors on form');
          return;
        }
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return HomePage();
        }));
        _formKey.currentState.save();

        // Then here we sign in and then we use Navigator.push() to get into our homepage
        // try {
        //   await FirebaseAuth.instance.signInWithEmailAndPassword(
        //       email: emailAdress, password: password);

        //   // If there are no error we check for the user first
        //   FirebaseAuth.instance.authStateChanges().listen((User user) {
        //     if (user != null) {
        //       // Push user to homePage
        //       Navigator.push(context, MaterialPageRoute(builder: (_) {
        //         return HomePage();
        //       }));
        //     }
        //   });
        // } on FirebaseException catch (e) {
        //   if (e.code == 'user-not-found') {
        //     print('User is not found bro');
        //     return;
        //   } else if (e.code == 'wrong-passowrd') {
        //     print('The entry does not matches anything in our records');
        //     return;
        //   }
        // }
      },
    );
  }
}
