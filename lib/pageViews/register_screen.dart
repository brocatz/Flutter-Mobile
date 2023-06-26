import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_form/changeNotifier/formNotifier.dart';
import 'package:flutter_form/constant/Constant.dart';
import 'package:intl/intl.dart';
import 'package:flutter_form/widgets/errorCustomRegistrationAnimation.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  String nameError;
  bool _isNameErrorActive = false;

  String lastNameError;
  bool _isLastNameErrorActive = false;

  String emailError;
  bool _isEmailErrorActive = false;

  String customBirthDayError;
  bool _isCustomBirthdayErrorActive = false;

  // FocusNode _focusNodeBuildBirthDate;

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
                AppLocalizations.of(context).register,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 15),
            _buildName(),
            buildCustomErrorWidgetOfType(nameError, _isNameErrorActive),
            SizedBox(height: 15),
            _buildLastName(),
            buildCustomErrorWidgetOfType(lastNameError, _isLastNameErrorActive),
            SizedBox(height: 15),
            _buildEmail(),
            buildCustomErrorWidgetOfType(emailError, _isEmailErrorActive),
            SizedBox(height: 15),
            _buildBirthDate(),
            _buildBirthDateErrorCustom(),
            SizedBox(height: 15),
            _submit(), // Next Button
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }

  Widget _buildName() {
    return TextFormField(
      style: TextStyle(
        fontSize: 16,
      ),
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        // labelText: 'Name'
        hintText: AppLocalizations.of(context).form_firstName,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(Icons.account_circle),
        filled: true,
        fillColor: Color(0xFFdee2ff),
        errorStyle: TextStyle(height: 0, color: Colors.transparent),
      ),
      onSaved: (value) {
        name = value;
      },
      onChanged: (value) {
        setState(() {
          _isNameErrorActive = false;
        });
      },
      validator: (value) {
        if (value.isEmpty) {
          setState(() {
            _isNameErrorActive = true;
            nameError = 'Please enter your name';
          });
          return nameError;
        }
        if (!RegExp('[a-zA-Z]{1}[a-zA-Z]{1,20}').hasMatch(value)) {
          setState(() {
            _isNameErrorActive = true;
            nameError = 'Letters only ';
          });
          return nameError;
        }

        return null;
      },
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
          hintText: AppLocalizations.of(context).form_lastName,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(Icons.account_circle),
          filled: true,
          fillColor: Color(0xFFdee2ff),
          errorStyle: TextStyle(height: 0, color: Colors.transparent)),
      onSaved: (value) {
        name = value;
      },
      onChanged: (value) {
        setState(() {
          _isLastNameErrorActive = false;
        });
      },
      validator: (value) {
        if (value.isEmpty) {
          setState(() {
            _isLastNameErrorActive = true;
            lastNameError = 'Please enter your last name';
          });

          return lastName;
        }
        if (!RegExp('[a-zA-Z]{1}[a-zA-Z]{1,20}').hasMatch(value)) {
          setState(() {
            _isLastNameErrorActive = true;
            lastNameError = "Letters only";
          });
          return lastNameError;
        }

        return null;
      },
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
          hintText: AppLocalizations.of(context).form_email,
          prefixIcon: Icon(Icons.mail),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Color(0xFFdee2ff),
          errorStyle: TextStyle(height: 0, color: Colors.transparent)),
      onSaved: (value) {
        email = value;
      },
      onChanged: (value) {
        setState(() {
          _isEmailErrorActive = false;
        });
      },
      validator: (value) {
        if (value.isEmpty) {
          setState(() {
            emailError = 'Please enter an email Adress';
            _isEmailErrorActive = true;
          });
          return emailError;
        }

        if (!EmailValidator.validate(value)) {
          setState(() {
            emailError = 'Please enter a valid email address';
            _isEmailErrorActive = true;
          });
          return emailError;
        }

        return null; // Validation Successful
      },
      toolbarOptions: ToolbarOptions(
        copy: false,
        cut: false,
        selectAll: false,
        paste: false,
      ),
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
            if (birthday != null) _isCustomBirthdayErrorActive = false;
          });
        });
      },
      validator: (value) {
        if (value.isEmpty) {
          setState(() {
            customBirthDayError = ' Please enter a date ';
            _isCustomBirthdayErrorActive = true;
          });
          return customBirthDayError;
        }
        if (DateTime.tryParse(value) == null) return 'Please enter a valide';

        return null; // No error
      },
      showCursor: false, // Hides the keyboard
      readOnly: true, // Hides the keyboard
      //focusNode: _focusNodeBuildBirthDate,
      keyboardType: TextInputType.numberWithOptions(),
      style: TextStyle(fontSize: 16),
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context).form_birthday,
        fillColor: Color(0xFFdee2ff),
        filled: true,
        prefixIcon: Icon(Icons.calendar_today_rounded),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        // We are going to create our custom error Handling
        errorStyle: TextStyle(
          height: 0,
          color: Colors.transparent,
        ),
        // errorBorder: OutlineInputBorder(
        //   borderSide: BorderSide.none,
        //   borderRadius: BorderRadius.all(Radius.circular(30)),
        // ),
      ),
    );
  }

// The name of this widget should be next
  Widget _submit() {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(formButtonColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ))),
      child: Text(
        AppLocalizations.of(context).form_next,
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

  ///////////////////////////////////////////////////////////
  ///               ERROR WIDGETS                        ///
  /////////////////////////////////////////////////////////
  ///
  ///  The other reference are in
  /// flutter_form/widgets/errorCustomRegistrationAnimation.dart
  /// since most of the error are

  Widget _buildBirthDateErrorCustom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
            constraints: BoxConstraints(minHeight: 22, maxHeight: 22),
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 500),
            margin: EdgeInsets.only(top: 2.8),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1 / 2),
            decoration: BoxDecoration(
                color: _isCustomBirthdayErrorActive
                    ? Color(0xFFbd1f36)
                    : Colors.transparent, //Color(0xFFa01a58),
                border: Border.all(style: BorderStyle.none),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                    color: _isCustomBirthdayErrorActive
                        ? Colors.white
                        : Colors.transparent),
                children: <InlineSpan>[
                  WidgetSpan(
                      child: Icon(
                    Icons.priority_high,
                    color: _isCustomBirthdayErrorActive
                        ? Colors.white
                        : Colors.transparent,
                    size: 16,
                  )),
                  TextSpan(text: 'Please enter a valid birthday'),
                  WidgetSpan(
                    child: Icon(
                      Icons.priority_high,
                      color: _isCustomBirthdayErrorActive
                          ? Colors.white
                          : Colors.transparent,
                      size: 16,
                    ),
                  ),
                ],
              ),
            )

            // Text(
            //   '\u26A0 An Error text over here \u26A0',
            //   style: TextStyle(color: Colors.white),
            // ),
            ),
      ],
    );
  }
}
