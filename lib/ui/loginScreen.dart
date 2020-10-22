import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:gourmet_lounge/ui/forgotPasswordScreen.dart';

import 'homeScreen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image(
                    image: AssetImage('assets/images/GourmetLounge_Logo.png'),
                    width: 106.0,
                    height: 106.0,
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Container(
                  child: Image(
                    image:
                        AssetImage('assets/images/GourmetLounge_txtBlack.png'),
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
                  width: 246,
                  height: 37,
                  child: TextField(
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
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  width: 246,
                  height: 37,
                  child: TextField(
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
                  ),
                ),
                SizedBox(
                  height: 78,
                ),
                Container(
                  width: 257.0,
                  height: 40.0,
                  child: Builder(
                    builder: (context) => RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
