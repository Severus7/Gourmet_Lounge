import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future updateUserData(
      String firstName, String lastName, String email, String password) async {
    //...
    return await userCollection.document(uid).setData({
      'First name': firstName,
      'Last name': lastName,
      'Email address': email,
      'Password': password,
    });
  }

  //get user streams
  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }

//-----------------------------
//  final String uid;
//  DatabaseService({this.uid});
//
//  //collection reference
//  final CollectionReference gourmetCollection =
//      FirebaseFirestore.instance.collection('gourmets');
//
//  Future updateUserData(String firstName, String lastName) async {
//    return await gourmetCollection.doc(uid).set({
//      'Firstname': firstName,
//      'Lastname': lastName,
//    });
//  }
}
