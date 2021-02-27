import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

void main() => runApp(FormTutorial());

class FormTutorial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.all(20),
              child: MyCustomForm(),
            ),
          ),
        ));
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  bool isTextObscure = true; // changes also the icon
  bool isConfirmTextObsure = true;
  // from Icons.visibility_off to Icons.visibility

  String name;
  String lastName;
  String email;
  String password;
  String confirmPassword;

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
      validator: (value) {
        if (value.isEmpty) return 'Please enter some text';
        if (!RegExp('[a-zA-z]{1}[a-zA-Z]{1,20}').hasMatch(value))
          return 'Letters only ';

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
        hintText: 'Enter Email',
        prefixIcon: Icon(Icons.mail),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: Color(0xFFdee2ff),
      ),
      onSaved: (value) {},
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter emailAdress';
        }

        if (!EmailValidator.validate(value)) {
          return 'Please enter a valid email address';
        }

        return null; // Validation Successful
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
      ),
      obscureText: isTextObscure,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a password';
        }
        return null; // validation is correcg
      },
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
      validator: (value) {
        if (value.isEmpty) return 'Please enter your password again';
        return null;
      },
      onSaved: (value) {
        // Save the value
      },
    );
  }

  Widget _buildBirthDay() {
    return TextFormField(
      decoration: InputDecoration.collapsed(hintText: 'Enter your birthday'),
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.datetime,
      validator: (value) {
        return null;
      },
    );
  }

  Widget _submit() {
    return RaisedButton(
      color: Color(0xFF90be6d),
      child: Text(
        'Submit',
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
      onPressed: () {
        if (!_formKey.currentState.validate()) return 'Return Something';
        _formKey.currentState
            .save(); // Saved all the elements with the onsave method
        print('Saved');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          Container(
            height: 50,
            child: Text(
              'Register',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          _buildName(),
          SizedBox(height: 6),
          _buildEmail(),
          SizedBox(height: 6),
          _buildPassword(),
          SizedBox(height: 6),
          _buildConfirmPassword(),
          SizedBox(height: 10),
          _submit(),
        ],
      ),
    );
  }
}
