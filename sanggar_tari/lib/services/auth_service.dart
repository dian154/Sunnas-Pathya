import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  // Services SignIn Anonymously
  static Future signAnonymous() async {
    try {
      // AuthResult
      UserCredential result = await _auth.signInAnonymously();
      // FirebaseUser
      User? firebaseUser = result.user;
      return firebaseUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //  Services Sign Up
  static Future<User?> SignUp(String email, String Password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: Password);
      User? firebaseUser = result.user;
      return firebaseUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Services Sign In
  static Future<User?> SignIn(String email, String Password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: Password);
      User? firebaseUser = result.user;
      return firebaseUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //  Services SignOut
  static Future signOut() async {
    _auth.signOut();
  }

  static Stream<User?> get firebaseUserStream => _auth.authStateChanges();
}
