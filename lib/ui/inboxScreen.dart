import 'package:flutter/material.dart';

class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              child: Text('This is the Inbox Page'),
            ),
          ),
        ),
      ),
    );
  }
}
