import 'package:flutter/material.dart';
import 'package:gourmet_lounge/ui/userProfileScreen.dart';
import 'package:gourmet_lounge/widgets/customApplicationBar.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EditProfile(),
    );
  }
}

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GLAppBar(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Container(
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, size: 30, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Expanded(
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      color: Colors.white,
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
