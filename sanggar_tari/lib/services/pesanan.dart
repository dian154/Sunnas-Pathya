import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'dart:io';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:sanggar_tari/models/pesanan_tari.dart';

// untuk Pesanan Tari
class PesananService with ChangeNotifier {
  String urlMaster = "https://sanggartari-2eb4f-default-rtdb.firebaseio.com/";
  List<PesananTari> _allPesanan = [];

  List<PesananTari> get allPesanan => _allPesanan;

  Future<void> addPesanan(
      // String id,
      String name,
      String email,
      String noTelp,
      String alamat,
      String namaTari,
      String jumlahTari,
      String tanggalTari) async {
    Uri url = Uri.parse("$urlMaster/pesanan.json");
    DateTime dateNow = DateTime.now();
    try {
      var response = await http.post(
        url,
        body: json.encode({
          // "id": id,
          "name": name,
          "email": email,
          "noTelp": noTelp,
          "alamat": alamat,
          "namaTari": namaTari,
          "jumlahTari": jumlahTari,
          "tanggalTari": tanggalTari,
        }),
      );

      if (response.statusCode > 300 || response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        PesananTari data = PesananTari(
          id: json.decode(response.body)["name"].toString(),
          name: name,
          email: email,
          noTelp: noTelp,
          alamat: alamat,
          namaTari: namaTari,
          jumlahTari: jumlahTari,
          tanggalTari: tanggalTari,
        );

        _allPesanan.add(data);
        notifyListeners();
      }
    } catch (err) {
      throw (err);
    }
  }

  void editPesanan(
      String id,
      String name,
      String email,
      String noTelp,
      String alamat,
      String namaTari,
      String jumlahTari,
      String tanggalTari) async {
    Uri url = Uri.parse("$urlMaster/pesanan/$id.json");
    DateTime date = DateTime.now();
    try {
      var response = await http.patch(
        url,
        body: json.encode({
          "name": name,
          "email": email,
          "noTelp": noTelp,
          "alamat": alamat,
          "namaTari": namaTari,
          "jumlahTari": jumlahTari,
          "tanggalTari": tanggalTari,
        }),
      );

      if (response.statusCode > 300 || response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        PesananTari edit =
            _allPesanan.firstWhere((element) => element.id == id);
        edit.name = name;
        edit.email = email;
        edit.noTelp = noTelp;
        edit.alamat = alamat;
        edit.namaTari = namaTari;
        edit.jumlahTari = jumlahTari;
        edit.tanggalTari = tanggalTari;
        notifyListeners();
      }
    } catch (err) {
      throw (err);
    }
  }

  void deletePesanan(String id) async {
    Uri url = Uri.parse("$urlMaster/pesanan/$id.json");

    try {
      var response = await http.delete(url);

      if (response.statusCode > 300 || response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        _allPesanan.removeWhere((element) => element.id == id);
        notifyListeners();
      }
    } catch (err) {
      throw (err);
    }
  }

  PesananTari selectById(String id) {
    return _allPesanan.firstWhere((element) => element.id == id);
  }

  Future<void> inisialData() async {
    Uri url = Uri.parse("$urlMaster/pesanan.json");

    try {
      var response = await http.get(url);

      print(response.statusCode);

      if (response.statusCode >= 300 && response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        var data = json.decode(response.body) as Map<String, dynamic>;
        if (data != null) {
          data.forEach(
            (key, value) {
              PesananTari prod = PesananTari(
                id: key,
                name: value["name"],
                email: value["email"],
                noTelp: value["noTelp"],
                alamat: value["alamat"],
                namaTari: value["namaTari"],
                jumlahTari: value["jumlahTari"],
                tanggalTari: value["tanggalTari"],
              );
              _allPesanan.add(prod);
            },
          );
        }
      }
    } catch (err) {
      throw (err);
    }
  }
}
