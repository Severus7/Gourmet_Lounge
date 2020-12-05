import 'package:flutter/material.dart';
import 'package:gourmet_lounge/services/authentication.dart';
import 'package:gourmet_lounge/shared/loading.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Registration(),
    );
  }
}

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final AuthService _auth = AuthService();
  bool loading = false;

  String firstName;
  String lastName;
  String email;
  String password;
  String _confirmPassword;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildFirstName() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'First name',
        labelStyle: TextStyle(
          fontFamily: 'Roboto',
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'This field is required';
        }

        if (RegExp("^[0-9*#+]+").hasMatch(value)) {
          return 'Please enter a valid name';
        }
      },
      onSaved: (String value) {
        firstName = value;
      },
    );
  }

  Widget _buildLastName() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Last name',
        labelStyle: TextStyle(
          fontFamily: 'Roboto',
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'This field is required';
        }

        if (RegExp("^[0-9*#+]+").hasMatch(value)) {
          return 'Please enter a valid name';
        }
      },
      onSaved: (String value) {
        lastName = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email address',
        labelStyle: TextStyle(
          fontFamily: 'Roboto',
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'This field is required';
        }

        if (!RegExp('(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+)')
            .hasMatch(value)) {
          return 'Please enter a valid email';
        }
      },
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(
          fontFamily: 'Roboto',
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'This field is required';
        }
      },
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget _buildConfirmPassword() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        labelStyle: TextStyle(
          fontFamily: 'Roboto',
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'This field is required';
        }

        if (value != password) {
          return 'Password does not match';
        }
      },
      onSaved: (String value) {
        _confirmPassword = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFFF03705),
              title: const Text(
                'Create account',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                ),
              ),
            ),
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Icon(
                          Icons.account_circle,
                          size: 100,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        height: 460,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Color(0xFFF03705),
                            width: 2,
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                _buildFirstName(),
                                _buildLastName(),
                                _buildEmail(),
                                _buildPassword(),
                                //_buildConfirmPassword(),
                                SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 24),
                                  width: MediaQuery.of(context).size.width,
                                  child: RaisedButton(
                                    onPressed: () async {
                                      if (!_formKey.currentState.validate()) {
                                        return;
                                      } else if (_formKey.currentState
                                          .validate()) {
                                        setState(() => loading = true);
                                        dynamic result =
                                            await _auth.createAccount(email,
                                                password, firstName, lastName);

                                        if (result == null) {
                                          setState(() => loading = false);
                                        }
                                      }

//                              dynamic result = await _auth.createAnAccount(
//                                  email, password, firstName, lastName);
                                      _formKey.currentState.save();
                                      print(firstName);
                                      print(lastName);
                                      print(email);
                                      print(password);
                                    },
                                    textColor: Colors.white,
                                    color: Color(0xFFF03705),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Container(
                                      child: const Text(
                                        'Create Account',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
