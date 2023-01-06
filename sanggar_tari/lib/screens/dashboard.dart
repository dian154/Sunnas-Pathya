import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sanggar_tari/drawer/sidebar.dart';
import 'package:sanggar_tari/screens/login.dart';
import 'package:sanggar_tari/screens/pesananInput.dart';
import 'package:sanggar_tari/screens/pesanan_item.dart';
import 'package:sanggar_tari/services/database_service.dart';

class Dashboard extends StatefulWidget {
  final User? user;
  Dashboard(this.user);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DatabaseUsers db = DatabaseUsers();

  int data = 0;

  @override
  Widget build(BuildContext context) {
    User? firebaseUser = FirebaseAuth.instance.currentUser;
    // get all user
    // int data = 0;
    db.getDataUser().then((value) {
      if (this.mounted) {
        setState(() {
          data = value.length;
          // Your state change code goes here
        });
      }
    });
    // print(countsUser);

    print(data);

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      endDrawer: sideBar(user: widget.user),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 400,
              width: 400,
              padding: EdgeInsets.only(top: 10),
              child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                  ),
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigator.pushAndRemoveUntil(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => LoginWidget()),
                        //     (route) => false);
                      },
                      child: Card(
                        elevation: 20,
                        margin: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Container(
                                  height: 130,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/anggota1.jpeg"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(top: 5, left: 10),
                              child: Text(
                                'Jumlah Anggota $data',
                                style: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto'),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(top: 5, left: 10),
                              child: Text(
                                'Sanggar Tari',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PesananInput()));
                      },
                      child: Card(
                        elevation: 20,
                        margin: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Container(
                                  height: 130,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/pesanan1.jpeg"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(top: 5, left: 10),
                              child: Text(
                                'Jumlah Pesanan',
                                style: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto'),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(top: 5, left: 10),
                              child: Text(
                                'Sanggar Tari',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
            SizedBox(height: 120),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginWidget()),
                    (route) => false);
              },
              child: Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
