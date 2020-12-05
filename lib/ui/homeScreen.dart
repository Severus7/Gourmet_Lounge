import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gourmet_lounge/icons/navigationBarIcons.dart';
import 'package:gourmet_lounge/services/authentication.dart';
import 'package:gourmet_lounge/ui/inboxScreen.dart';
import 'package:gourmet_lounge/ui/searchScreen.dart';
import 'package:gourmet_lounge/ui/userProfileScreen.dart';
import 'package:gourmet_lounge/widgets/constants.dart';
import 'package:gourmet_lounge/widgets/customApplicationBar.dart';
import 'package:gourmet_lounge/services/database.dart';
import 'package:provider/provider.dart';
import 'package:gourmet_lounge/routeGenerator.dart';

import 'cards.dart';

int _selectedItem = 0;
final List pages = [
  CardView(),
  SearchScreen(),
  null,
  InboxScreen(),
  UserProfileScreen()
];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeInterface(),
//      initialRoute: '/',
//      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

void choiceAction(String choice) async {
  final AuthService _auth = AuthService();
  if (choice == Constants.Logout) {
    await _auth.logOut();
  } else if (choice == Constants.Profile) {
    BuildContext context;
    MaterialApp(
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );

    Navigator.of(_HomeInterfaceState().context).pushNamed('/myProfile');

//    HomeScreen build(BuildContext context) {
//      _selectedItem = 4;
//      var page = pages[4];
//      return page;
//    }
//    BuildContext context;
//    UserProfileScreen().build(context);
  }
}

class HomeInterface extends StatefulWidget {
  @override
  _HomeInterfaceState createState() => _HomeInterfaceState();
}

class _HomeInterfaceState extends State<HomeInterface> {
  //int _selectedItem = 0;
  //final List pages = [CardView(), SearchScreen(), null, InboxScreen(), UserProfileScreen()];
  final List appBar = [
    //HOME APPBAR
    GLAppBar(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "Gourmet's Lounge",
                  style: TextStyle(
                    fontFamily: 'Cassandra',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                child: IconButton(
                  icon: Icon(
                    Icons.account_circle,
                    size: 36,
                    color: Colors.white,
                  ),
                  onPressed: () {
//                    BuildContext context;
//                    Navigator.of(context).pushNamed('/myProfile');
                    runApp(UserProfileScreen());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    //SEARCH APP BAR
    GLAppBar(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: IconButton(
                  icon: Icon(Icons.arrow_back, size: 30, color: Colors.white),
                  onPressed: () {},
                ),
              ),
              Container(
                child: IconButton(
                  icon: Icon(Icons.search, size: 30, color: Colors.white),
                  onPressed: () {},
                ),
              ),
              Container(
                child: Expanded(
                  child: TextField(
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
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
    //UPLOAD
    GLAppBar(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "Gourmet's Lounge",
                  style: TextStyle(
                    fontFamily: 'Cassandra',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                child: IconButton(
                  icon: Icon(Icons.account_circle, size: 36),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    null
  ];
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().users,
      child: MaterialApp(
        home: Scaffold(
          appBar: appBar[_selectedItem],
          backgroundColor: Colors.white,
          bottomNavigationBar: BottomNavigationBar(
            onChange: (val) {
              setState(() {
                _selectedItem = val;
              });
            },
            defaultSelectedIndex: 0,
          ),
          body: pages[_selectedItem],
        ),
      ),
    );
  }
}

//AppBar

//Bottom Navigation Bar
class BottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;

  BottomNavigationBar({this.defaultSelectedIndex = 0, @required this.onChange});
  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
  int _selectedIndex = 0;
  @override
  void initState() {
    //TODO: implement initState
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
  }

  Widget build(BuildContext context) {
    return Row(
      children: [
        buildNavigationBarItem(Icons.home, 0, true),
        buildNavigationBarItem(Icons.search_outlined, 1, false),
        buildNavigationBarItem(Icons.upload_sharp, 2, false),
        buildNavigationBarItem(NavBarIcons.speech_bubble, 3, false),
      ],
    );
  }

  Widget buildNavigationBarItem(IconData icon, int index, bool isActive) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
          color: Color(0xFFF03705),
          border: index == _selectedIndex
              ? Border(
                  bottom: BorderSide(width: 2, color: Colors.white),
                )
              : Border(
                  bottom: BorderSide(
                    width: 0,
                    color: Color(0xFFF03705),
                  ),
                ),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }
}
