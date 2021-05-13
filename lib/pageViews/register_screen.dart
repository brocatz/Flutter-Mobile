import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_form/changeNotifier/formNotifier.dart';
import 'package:flutter_form/constant/Constant.dart';
import 'package:intl/intl.dart';

// This is in the pageView a PageView
// This is what the user see's when they lauch the app

class RegisterForm extends StatefulWidget {
  final FormNotifier formNotifier;
  RegisterForm({this.formNotifier});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  bool isTextObscure = true; // changes also the icon
  bool isConfirmTextObsure = true;
  // from Icons.visibility_off to Icons.visibility

  String name;
  String lastName;
  String email;
  String password;
  String confirmPassword;
  DateTime birthday;

  // FocusNode _focusNodeBuildBirthDate;

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
        hintText: 'Enter your first Name',
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

  Widget _buildLastName() {
    return TextFormField(
      style: TextStyle(
        fontSize: 16,
      ),
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        // labelText: 'Name'
        hintText: 'Enter your last name',
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

  Widget _submit() {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(formButtonColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ))),
      child: Text(
        'Next',
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
        this.widget.formNotifier.changeToRegisterPart2();
        // Change the pageView
      },
    );
  }

  Widget _buildBirthDate() {
    return TextFormField(
      controller: TextEditingController(
          text: (birthday != null)
              ? DateFormat('yyyy-MM-dd').format(birthday)
              : ''),
      onTap: () async {
        showDatePicker(
                context: context,
                initialDate: (birthday == null) ? DateTime.now() : birthday,
                firstDate: DateTime(1950),
                lastDate: DateTime.now())
            .then((value) {
          setState(() {
            birthday = value;
          });
        });
      },
      validator: (value) {
        if (value.isEmpty) return ' Please enter a date ';
        if (DateTime.tryParse(value) == null) return 'Please enter a valide';
        return null; // No error
      },
      showCursor: false, // Hides the keyboard
      readOnly: true, // Hides the keyboard
      //focusNode: _focusNodeBuildBirthDate,
      keyboardType: TextInputType.numberWithOptions(),
      style: TextStyle(fontSize: 16),
      decoration: InputDecoration(
        hintText: "Please enter your birth Date",
        fillColor: Color(0xFFdee2ff),
        filled: true,
        prefixIcon: Icon(Icons.calendar_today_rounded),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        // errorStyle: TextStyle(
        //   backgroundColor: Colors.red,
        //   color: Colors.white60,
        // ),
        // errorBorder: OutlineInputBorder(
        //   borderSide: BorderSide.none,
        //   borderRadius: BorderRadius.all(Radius.circular(30)),
        // ),
      ),
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
            _buildLastName(),
            SizedBox(height: 15),
            _buildEmail(),
            SizedBox(height: 15),
            // _buildPassword(),
            // SizedBox(height: 15),
            // _buildConfirmPassword(),
            _buildBirthDate(),
            SizedBox(height: 15),
            _submit(), // Next Button
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
