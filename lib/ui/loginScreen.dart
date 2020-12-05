import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gourmet_lounge/services/authentication.dart';
import 'package:gourmet_lounge/shared/loading.dart';
import 'dart:ui';
import 'package:gourmet_lounge/ui/forgotPasswordScreen.dart';

import 'homeScreen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool loading = false;

  String _userEmail = '';
  String _userPassword = '';
  String error = '';

  Widget _buildEmailAddress() {
    return Container(
      child: TextFormField(
        obscureText: false,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 15,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          hintText: 'Username or email',
          contentPadding: const EdgeInsets.fromLTRB(12, 9, 0, 9),
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please input email address';
          }
        },
        onChanged: (val) {
          setState(() => _userEmail = val);
        },
      ),
    );
  }

  Widget _buildPassword() {
    return Container(
      child: TextFormField(
        obscureText: true,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 15,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          hintText: 'Password',
          contentPadding: const EdgeInsets.fromLTRB(12, 9, 0, 9),
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please input password';
          }
        },
        onChanged: (val) {
          setState(() => _userPassword = val);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : MaterialApp(
            home: Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Image(
                            image: AssetImage(
                                'assets/images/GourmetLounge_Logo.png'),
                            width: 106.0,
                            height: 106.0,
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Container(
                          child: Image(
                            image: AssetImage(
                                'assets/images/GourmetLounge_txtBlack.png'),
                            width: 284.0,
                            height: 64.0,
                          ),
                        ),
                        Container(
                          child: Text(
                            'Lorem ipsum',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 37,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 57),
                          width: MediaQuery.of(context).size.width,
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                _buildEmailAddress(),
                                SizedBox(
                                  height: 8,
                                ),
                                _buildPassword(),
                                SizedBox(
                                  height: 78,
                                ),
                                Container(
                                  width: 257.0,
                                  height: 40.0,
                                  child: RaisedButton(
                                    onPressed: () async {
                                      if (!_formKey.currentState.validate()) {
                                        return;
                                      } else if (_formKey.currentState
                                          .validate()) {
                                        setState(() => loading = true);
                                        dynamic result = await _auth
                                            .signInWithEmailAndPassword(
                                                _userEmail, _userPassword);
                                        if (result == null) {
                                          setState(() => loading = false);
                                          print('Invalid credentials');
                                        }
                                      }

//                              dynamic result =
//                                  await _auth.loginWithEmailAndPassword(
//                                      _userEmail, _userPassword);
                                      print(_userEmail);
                                      print(_userPassword);
                                    },
                                    textColor: Colors.white,
                                    color: Color(0xFFF03705),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Container(
                                      child: const Text(
                                        'Login',
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
                        Container(
                          child: TextButton(
                            onPressed: () {
                              runApp(ForgotPassword());
                            },
                            child: Container(
                              child: const Text(
                                'Forgot password',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: TextButton(
                            onPressed: () async {
                              //..
                              dynamic result = await _auth.signInAnon();
                              if (result == null) {
                                print('Error signing in anonymously');
                              } else {
                                print('Sign in successful');
                              }
                            },
                            child: Container(
                              child: Text(
                                'Sign in anonymously',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
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
            ),
          );
  }
}
