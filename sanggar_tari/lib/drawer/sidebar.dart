import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sanggar_tari/drawer/mydrawer.dart';

import '../services/auth_service.dart';

class sideBar extends StatefulWidget {
  sideBar({Key? key, User? user}) : super(key: key);

  @override
  State<sideBar> createState() => _sideBarState();
}

class _sideBarState extends State<sideBar> {
  var signIn = AuthServices.SignIn;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            MyHeaderDrawer(signIn),
            //MyDrawerList(),
          ],
        ),
      )),
    );
  }
}
