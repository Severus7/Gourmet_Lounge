import 'package:flutter/material.dart';
import 'package:gourmet_lounge/main.dart';
import 'package:gourmet_lounge/ui/homeScreen.dart';
import 'package:gourmet_lounge/ui/userProfileScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //..
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/myProfile':
        return MaterialPageRoute(builder: (_) => UserProfileScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: Center(
          child: Text(
            'ERROR',
          ),
        ),
      );
    });
  }
}
