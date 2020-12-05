import 'package:flutter/material.dart';
import 'package:gourmet_lounge/widgets/customApplicationBar.dart';

class CardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.white,
              elevation: 2,
              child: ListTile(
                leading: CircleAvatar(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                title: Text("Foods"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CardViewDetails()));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class CardViewDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GLAppBar(),
    );
  }
}
