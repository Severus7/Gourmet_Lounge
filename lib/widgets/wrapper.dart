import 'package:flutter/material.dart';
import 'package:gourmet_lounge/model/user.dart';
import 'package:gourmet_lounge/ui/authenticate/authenticate.dart';
import 'package:gourmet_lounge/ui/homeScreen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return HomeScreen();
    }

//----------------------------------------
//    final user = Provider.of<UserModel>(context);
//
//    if (user == null) {
//      return Authenticate();
//    } else {
//      return HomeScreen();
//    }
  }
}
