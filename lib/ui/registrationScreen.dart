import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        ),
      ),
    );
  }
}
