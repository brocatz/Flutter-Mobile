import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter_form/constant/Constant.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_form/widgets/errorCustomRegistrationAnimation.dart';

class RegisterFormPart2 extends StatefulWidget {
  @override
  _RegisterFormPart2State createState() => _RegisterFormPart2State();
}

class _RegisterFormPart2State extends State<RegisterFormPart2> {
  final _formKey = GlobalKey<FormState>();

  bool isTextObscure = true; // changes also the icon
  bool isConfirmTextObsure = true;
  // from Icons.visibility_off to Icons.visibility

  String username;
  String password;
  String passwordRef; // this is use for the confirm password as a reference to
  // the password
  String confirmPassword;

  String userNameError;
  bool _isUserNameErrorActive = false;

  String passwordError;
  bool _isPasswordErrorActive = false;

  String confirmPasswordError;
  bool _isConfirmPasswordErrorActive = false;

  FirebaseAuth auth = FirebaseAuth.instance;

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
            _buildUserName(),
            buildCustomErrorWidgetOfType(userNameError, _isUserNameErrorActive),
            SizedBox(height: 15),
            _buildPassword(),
            buildCustomErrorWidgetOfType(passwordError, _isPasswordErrorActive),
            SizedBox(height: 15),
            _buildConfirmPassword(),
            buildCustomErrorWidgetOfType(
                confirmPasswordError, _isConfirmPasswordErrorActive),
            SizedBox(height: 15),
            _buildGender(),
            SizedBox(height: 15),
            _submit(),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }

  Widget _buildUserName() {
    return TextFormField(
      style: TextStyle(
        fontSize: 16,
      ),
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          // labelText: 'Name'
          hintText: 'Enter your preferred username',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(Icons.account_circle),
          filled: true,
          fillColor: Color(0xFFdee2ff),
          errorStyle: TextStyle(height: 0, color: Colors.transparent)),
      onSaved: (value) {
        username = value;
      },
      onChanged: (value) {
        setState(() {
          _isUserNameErrorActive = false;
        });
      },
      validator: (value) {
        if (value.isEmpty) {
          setState(() {
            _isUserNameErrorActive = true;
            userNameError = 'Please enter your display name';
          });
          return userNameError;
        }
        if (!RegExp('[a-zA-z]{1}[a-zA-Z]{1,20}').hasMatch(value)) {
          setState(() {
            _isUserNameErrorActive = true;
            userNameError = 'Letters numbers with _- only';
          });
          return userNameError;
        }

        return null;
      },
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
        errorStyle: TextStyle(height: 0, color: Colors.transparent),
      ),
      obscureText: isTextObscure,
      keyboardType: TextInputType.visiblePassword,
      onChanged: (value) {
        passwordRef = value;
        setState(() {
          _isPasswordErrorActive = false;
        });
      },
      validator: (value) {
        if (value.isEmpty) {
          setState(() {
            _isPasswordErrorActive = true;
            passwordError = 'Please enter a password';
          });
          return passwordError;
        }
        return null; // validation is correcg
      },
      onSaved: (value) {
        // save the value
        password = value;
      },
      toolbarOptions: ToolbarOptions(
        copy: false,
        paste: false,
        selectAll: false,
        cut: false,
      ),
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
        errorStyle: TextStyle(height: 0, color: Colors.transparent),
      ),
      onChanged: (value) {
        setState(() {
          _isConfirmPasswordErrorActive = false;
        });
      },
      validator: (value) {
        if (value.isEmpty) {
          setState(() {
            confirmPasswordError = "Please enter your password again";
            _isConfirmPasswordErrorActive = true;
          });
          return confirmPasswordError;
        }

        if (value != passwordRef) {
          setState(() {
            confirmPasswordError = "The passwords do not match";
            _isConfirmPasswordErrorActive = true;
          });
          return confirmPasswordError;
        }
        return null;
      },
      onSaved: (value) {
        confirmPassword = value;
      },
      toolbarOptions: ToolbarOptions(
        copy: false,
        paste: false,
        cut: false,
        selectAll: false,
      ),
    );
  }

  Widget _buildGender() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ToggleSwitch(
          minWidth: 90.0,
          labels: ['Male', 'Female'],
          activeBgColors: [Colors.blue, Colors.pink],
          onToggle: (index) {
            // Change the state of the gender using setState
          },
        ),
      ],
    );
  }

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
        // try {
        //   UserCredential userCredential = await FirebaseAuth.instance
        //       .createUserWithEmailAndPassword(email: email, password: password);
        //   // If the operation succeed register the user on our database
        //   // Then see if there is a user and then use the Navigator.push();
        //   FirebaseAuth.instance.authStateChanges().listen((User user) {
        //     if (user != null) {
        //       // Update  the display name then push data
        //       user.updateProfile(
        //         displayName: name,
        //       );
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (_) {
        //           return HomePage();
        //         }),
        //       );
        //     } else {
        //       print('An error Occuried when registering');
        //     }
        //   });
        // } on FirebaseAuthException catch (e) {
        //   if (e.code == 'weak-password') {
        //     print('Password is too weak');
        //   } else if (e.code == 'email-already-in-use') {
        //     print('The account already exist for that email');
        //   }
        // }
      },
    );
  }
}
