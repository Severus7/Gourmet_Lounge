import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.white,
              child: ListTile(
                title: Text("Foods"),
              ),
            );
          },
        ),
      ),
    );
  }
}
