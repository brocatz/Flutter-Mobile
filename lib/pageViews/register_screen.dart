import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_form/constant/Constant.dart';
import 'package:flutter_form/screens/home_screen.dart';

// This is in the pageView a PageView
// This is what the user see's when they lauch the app
class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  bool isTextObscure = true; // changes also the icon
  bool isConfirmTextObsure = true;
  // from Icons.visibility_off to Icons.visibility

  String name;
  String email;
  String password;
  String confirmPassword;

  FirebaseAuth auth = FirebaseAuth.instance;

  Widget _buildName() {
    return TextFormField(
      style: TextStyle(
        fontSize: 16,
      ),
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        // labelText: 'Name'
        hintText: 'Enter your first Name ',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(Icons.account_circle),
        filled: true,
        fillColor: Color(0xFFdee2ff),
      ),
      onSaved: (value) {
        name = value;
      },
      /* validator: (value) {
        if (value.isEmpty) return 'Please enter some text';
        if (!RegExp('[a-zA-z]{1}[a-zA-Z]{1,20}').hasMatch(value))
          return 'Letters only ';

        return null;
      }, */
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      style: TextStyle(
        fontSize: 16,
      ),
      textCapitalization: TextCapitalization.none,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Enter Email',
        prefixIcon: Icon(Icons.mail),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: Color(0xFFdee2ff),
      ),
      onSaved: (value) {
        email = value;
      },
      /*validator: (value) {
        if (value.isEmpty) {
          return 'Please enter emailAdress';
        }

        if (!EmailValidator.validate(value)) {
          return 'Please enter a valid email address';
        }

        return null; // Validation Successful
      },*/
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      style: TextStyle(
        fontSize: 16,
      ),
      decoration: InputDecoration(
        fillColor: Color(0xFFdee2ff),
        filled: true,
        hintText: 'Password',
        prefixIcon: Icon(Icons.lock_rounded),
        suffixIcon: IconButton(
          color: isTextObscure ? Colors.blueGrey : Colors.blue,
          icon: isTextObscure
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
          onPressed: () {
            setState(() {
              isTextObscure = !isTextObscure;
            });
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide.none,
        ),
      ),
      obscureText: isTextObscure,
      keyboardType: TextInputType.visiblePassword,
      /*validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a password';
        }
        return null; // validation is correcg
      }, */
      onSaved: (value) {
        // save the value
        password = value;
      },
    );
  }

  Widget _buildConfirmPassword() {
    return TextFormField(
      obscureText: isConfirmTextObsure,
      decoration: InputDecoration(
        hintText: 'Confirm Password my boi',
        filled: true,
        fillColor: Color(0xFFdee2ff),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none),
        prefixIcon: Icon(Icons.lock_rounded),
        suffixIcon: IconButton(
          icon: Icon(
              isConfirmTextObsure ? Icons.visibility_off : Icons.visibility),
          color: isConfirmTextObsure ? Colors.blueGrey : Colors.blue,
          onPressed: () {
            // The setState cause the componenet to Re render
            setState(() {
              isConfirmTextObsure = !isConfirmTextObsure;
            });
          },
        ),
      ),
      /*validator: (value) {
        if (value.isEmpty) return 'Please enter your password again';
        return null;
      },*/
      onSaved: (value) {
        confirmPassword = value;
      },
    );
  }

/*
  Widget _buildBirthDay() {
    return TextFormField(
      decoration: InputDecoration.collapsed(hintText: 'Enter your birthday'),
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.datetime,
      validator: (value) {
        return null;
      },
    );
  
*/
  Widget _submit() {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(formButtonColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ))),
      child: Text(
        'Register',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
      ),
      onPressed: () async {
        if (!_formKey.currentState.validate()) return 'Return Something';
        _formKey.currentState
            .save(); // Saved all the elements with the onsave method
        print('Saved');
        // Register the user
        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password);
          // If the operation succeed register the user on our database
          // Then see if there is a user and then use the Navigator.push();
          FirebaseAuth.instance.authStateChanges().listen((User user) {
            if (user != null) {
              // Update  the display name then push data
              user.updateProfile(
                displayName: name,
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) {
                  return HomePage();
                }),
              );
            } else {
              print('An error Occuried when registering');
            }
          });
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            print('Password is too weak');
          } else if (e.code == 'email-already-in-use') {
            print('The account already exist for that email');
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            // SizedBox(height: 60),
            Container(
              height: 50,
              child: Text(
                'Register',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 15),
            _buildName(),
            SizedBox(height: 15),
            _buildEmail(),
            SizedBox(height: 15),
            _buildPassword(),
            SizedBox(height: 15),
            _buildConfirmPassword(),
            SizedBox(height: 15),
            _submit(),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
