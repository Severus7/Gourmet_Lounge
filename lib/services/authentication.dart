import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gourmet_lounge/model/user.dart';
import 'package:gourmet_lounge/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //User object
  UserModel _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<UserModel> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //Register with email and password
  Future createAccount(
      String email, String password, String firstName, String lastName) async {
    try {
      //..
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      // create a new document for the user with uid
      await DatabaseService(uid: user.uid)
          .updateUserData(firstName, lastName, email, password);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign in anonymously
  Future signInAnon() async {
    try {
      //..
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Signing out
  Future logOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//-----------------------------------------------------------------
//  AuthService();
//
//  //Create user object based on FirebaseUser
//  UserModel _userFromFirebaseUser(User user) {
//    return user != null ? UserModel(uid: user.uid) : null;
//  }

  //Auth change user stream
//  Stream<UserModel> get authStateChanges =>
//      _auth.authStateChanges().map(_userFromFirebaseUser);

  //Register user
//  Future createAnAccount(
//      String email, String password, String firstName, String lastName) async {
//    try {
//      UserCredential result = await _auth.createUserWithEmailAndPassword(
//          email: email, password: password);
//      User user = result.user;
//
//      //Create document for the user uid
//      await DatabaseService(uid: user.uid).updateUserData(firstName, lastName);
//      return _userFromFirebaseUser(user);
//    } catch (e) {
//      print(e.toString());
//      return null;
//    }
//  }
//
//  //Login user
//  Future loginWithEmailAndPassword(String email, String password) async {
//    try {
//      UserCredential result = await _auth.signInWithEmailAndPassword(
//          email: email, password: password);
//      User user = result.user;
//      return _userFromFirebaseUser(user);
//    } catch (e) {
//      print(e.toString());
//      return null;
//    }
//  }
}
