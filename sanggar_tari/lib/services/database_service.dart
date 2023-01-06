import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'dart:io';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:sanggar_tari/models/pesanan_tari.dart';

import '../models/user.dart';

// untuk User
class DatabaseUsers with ChangeNotifier {
  String urlMaster = "https://sanggartari-2eb4f-default-rtdb.firebaseio.com/";
  List<User> _allUser = [];

  List<User> get allUser => _allUser;

  Future<void> addUser(String id, String name, String alamat, String noTelp,
      String email) async {
    Uri url = Uri.parse("$urlMaster/users.json");
    DateTime dateNow = DateTime.now();
    try {
      var response = await http.post(
        url,
        body: json.encode({
          "id": id,
          "name": name,
          "alamat": alamat,
          "noTelp": noTelp,
          "email": email
        }),
      );

      if (response.statusCode > 300 || response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        User data = User(
            id: id, name: name, alamat: alamat, noTelp: noTelp, email: email);

        _allUser.add(data);
        notifyListeners();
      }
    } catch (err) {
      throw (err);
    }
  }

  // get data user
  Future<List<User>> getDataUser() async {
    Uri url = Uri.parse("$urlMaster/users.json");
    var response = await http.get(url);
    if (response.statusCode > 300 || response.statusCode <= 200) {
      // print('response: ${response.body}');
      // print(response.statusCode);

      var data = json.decode(response.body) as Map<String, dynamic>;
      List<User> temp = [];
      data.forEach((key, value) {
        temp.add(User(
            id: value["id"],
            name: value["name"],
            alamat: value["alamat"],
            noTelp: value["noTelp"].toString(),
            email: value["email"]));
      });
      // print('temp: $temp');
      notifyListeners();
      return _allUser = temp;
    } else {
      print('response: ${response.statusCode}');
      return _allUser;
    }

    //  get user id
  }

  inisialData() {}
}
