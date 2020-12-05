import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gourmet_lounge/model/user.dart';
import 'package:gourmet_lounge/services/authentication.dart';
import 'package:gourmet_lounge/ui/loginScreen.dart';
import 'package:gourmet_lounge/ui/openingScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gourmet_lounge/widgets/wrapper.dart';
import 'package:provider/provider.dart';

void main() async {
//  WidgetsFlutterBinding.ensureInitialized();
//  await Firebase.initializeApp();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
