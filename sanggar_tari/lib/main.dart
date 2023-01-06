// import 'dart:html';

import 'package:sanggar_tari/screens/addPesanan.dart';
import 'package:sanggar_tari/screens/editPesanan.dart';
import 'package:sanggar_tari/screens/login.dart';
import 'package:sanggar_tari/services/database_service.dart';
import 'package:sanggar_tari/services/pesanan.dart';
import 'package:sanggar_tari/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './services/auth_service.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return StreamProvider.value(
    //   value: AuthServices.firebaseUserStream,
    //   initialData: null,
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home: Wrapper(),
    //   ),
    // );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => DatabaseUsers(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => PesananService(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
        routes: {
          '/editPesanan': (context) => EditPesanan(),
          // EditPesanan.route: (context) => EditPesanan(),
        },
      ),
    );
  }
}
