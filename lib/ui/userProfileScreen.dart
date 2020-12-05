import 'package:flutter/material.dart';
import 'package:gourmet_lounge/icons/navigationBarIcons.dart';
import 'package:gourmet_lounge/services/authentication.dart';
import 'package:gourmet_lounge/ui/cards.dart';
import 'package:gourmet_lounge/ui/editProfileScreen.dart';
import 'package:gourmet_lounge/ui/homeScreen.dart';
import 'package:gourmet_lounge/ui/inboxScreen.dart';
import 'package:gourmet_lounge/ui/searchScreen.dart';
import 'package:gourmet_lounge/widgets/customApplicationBar.dart';

class UserProfileScreen extends StatelessWidget {
  final String data;

  UserProfileScreen({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserProfile(),
    );
  }
}

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: GLAppBar(
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Container(
                    child: IconButton(
                      icon:
                          Icon(Icons.arrow_back, size: 30, color: Colors.white),
                      onPressed: () {
                        runApp(HomeScreen());
                      },
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Username Username",
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
        body: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_circle,
                      size: 80,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Firstname Lastname',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Firstname Lastname',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                          Container(
                            height: 35,
                            child: Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EditProfileScreen()));
                                  },
                                  child: Text(
                                    'Edit Profile',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    await _auth.logOut();
                                  },
                                  child: Text(
                                    'Sign out',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Bottom Navigation Bar
//class BottomNavigationBar extends StatefulWidget {
//  final int defaultSelectedIndex;
//  final Function(int) onChange;
//
//  BottomNavigationBar({this.defaultSelectedIndex = 0, @required this.onChange});
//  @override
//  _BottomNavigationBarState createState() => _BottomNavigationBarState();
//}
//
//class _BottomNavigationBarState extends State<BottomNavigationBar> {
//  int _selectedIndex = 0;
//  @override
//  void initState() {
//    //TODO: implement initState
//    super.initState();
//
//    _selectedIndex = widget.defaultSelectedIndex;
//  }
//
//  Widget build(BuildContext context) {
//    return Row(
//      children: [
//        buildNavigationBarItem(Icons.home, 0, true),
//        buildNavigationBarItem(Icons.search_outlined, 1, false),
//        buildNavigationBarItem(Icons.upload_sharp, 2, false),
//        buildNavigationBarItem(NavBarIcons.speech_bubble, 3, false),
//      ],
//    );
//  }
//
//  Widget buildNavigationBarItem(IconData icon, int index, bool isActive) {
//    return GestureDetector(
//      onTap: () {
//        widget.onChange(index);
//        setState(() {
//          _selectedIndex = index;
//        });
//      },
//      child: Container(
//        height: 60,
//        width: MediaQuery.of(context).size.width / 4,
//        decoration: BoxDecoration(
//          color: Color(0xFFF03705),
//          border: index == _selectedIndex
//              ? Border(
//                  bottom: BorderSide(width: 2, color: Colors.white),
//                )
//              : Border(
//                  bottom: BorderSide(
//                    width: 0,
//                    color: Color(0xFFF03705),
//                  ),
//                ),
//        ),
//        child: Icon(
//          icon,
//          color: Colors.white,
//          size: 32,
//        ),
//      ),
//    );
//  }
//}
