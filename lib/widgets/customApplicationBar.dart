import 'package:flutter/material.dart';

class GLAppBar extends PreferredSize {
  final Widget child;
  final double height;

  GLAppBar({@required this.child, this.height = 90});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: preferredSize.height,
      color: Color(0xFFF03705),
      alignment: Alignment.center,
      child: child,
    );
  }
}

class SearchAppBar extends AppBar {
  Icon customIcon = Icon(Icons.search);
  SearchAppBar({Key key, Color color, Widget title, Widget leading})
      : super(
            key: key,
            backgroundColor: Color(0xFFF03705),
            leading: Icon(
              Icons.arrow_back,
              size: 30,
            ),
            title: Text(
              'Search',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
              ),
            ),
            actions: <Widget>[
              new IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              )
            ]);
}
