import 'package:flutter/material.dart';
import 'package:gourmet_lounge/ui/loginScreen.dart';
import 'package:gourmet_lounge/ui/registrationScreen.dart';

class OpeningScreen extends StatelessWidget {
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
                      height: 106.0),
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
                SizedBox(
                  height: 212,
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
                                builder: (context) => RegistrationScreen()));
                      },
                      textColor: Colors.white,
                      color: Color(0xFFF03705),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Container(
                        child: const Text(
                          'Create an account',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: 257.0,
                  height: 40.0,
                  child: RaisedButton(
                    onPressed: () {
                      runApp(LoginScreen());
                    },
                    textColor: Color(0xFFF03705),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(
                        color: Color(0xFFF03705),
                      ),
                    ),
                    child: Container(
                      child: const Text(
                        'I have an account',
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
    );
  }
}
