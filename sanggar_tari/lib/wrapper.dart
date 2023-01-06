import 'package:sanggar_tari/main.dart';
import 'package:sanggar_tari/screens/dashboard.dart';
import 'package:sanggar_tari/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? firebaseUser = Provider.of<User?>(context);
    print(firebaseUser == null);
    return (firebaseUser == null)
        ? const LoginWidget()
        : Dashboard(firebaseUser);
  }
}
