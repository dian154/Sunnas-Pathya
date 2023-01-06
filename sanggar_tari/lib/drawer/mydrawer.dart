import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sanggar_tari/drawer/sidebar.dart';
import 'package:sanggar_tari/screens/login.dart';
import 'package:sanggar_tari/screens/pesananInput.dart';
import 'package:sanggar_tari/services/auth_service.dart';

class MyHeaderDrawer extends StatefulWidget {
  MyHeaderDrawer(signIn);

  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  // var signIn = AuthServices.SignIn;
  // final User? user;
  // MyHeaderDrawer(this.user);

  @override
  Widget build(BuildContext context) {
    User? firebaseUser = FirebaseAuth.instance.currentUser;

    return Container(
      child: Container(
        color: Colors.blue,
        width: double.infinity,
        height: 200,
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/akun.png'),
                  // image: NetworkImage(
                  //     'https://i.pinimg.com/originals/0c/2e/2d/0c2e2d901e2d8aa58546e150bdc4239f.jpg'),
                ),
              ),
            ),
            Text(
              "Account",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "Anggota Sanggar Tari",
              style: TextStyle(
                color: Colors.grey[200],
                fontSize: 14,
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
          ],
        ),
      ),
    );
  }
}
