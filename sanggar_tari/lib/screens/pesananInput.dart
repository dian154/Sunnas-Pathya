import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sanggar_tari/models/pesanan_tari.dart';
import 'package:sanggar_tari/models/user.dart';
import 'package:sanggar_tari/screens/pesanan_item.dart';
import 'package:sanggar_tari/services/database_service.dart';
import 'package:sanggar_tari/services/auth_service.dart';
import 'package:sanggar_tari/services/pesanan.dart';

import 'addPesanan.dart';

class PesananInput extends StatefulWidget {
  // static const route = "/home";

  @override
  _PesananInputState createState() => _PesananInputState();
}

class _PesananInputState extends State<PesananInput> {
  bool isInit = true;
  bool isLoading = false;

  @override
  void didChangeDependencies() {
    if (isInit) {
      isLoading = true;
      Provider.of<PesananService>(context, listen: false)
          .inisialData()
          .then((value) {
        setState(() {
          isLoading = false;
        });
      }).catchError(
        (err) {
          print(err);
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Error Occured"),
                content: Text(err.toString()),
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isLoading = false;
                      });
                      Navigator.pop(context);
                    },
                    child: Text("Okay"),
                  ),
                ],
              );
            },
          );
        },
      );

      isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // if (mounted) {
    //   setState(() {
    //     // Your state change code goes here
    //   });
    // }
    final prov = Provider.of<PesananService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Semua Pesanan"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AddPesanan();
              }));
            },
          ),
        ],
      ),
      body: (isLoading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : (prov.allPesanan.length == 0)
              ? Center(
                  child: Text(
                    "Belum Ada Pesanan",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: prov.allPesanan.length,
                  itemBuilder: (context, i) => PesananItem(
                    prov.allPesanan[i].id,
                    prov.allPesanan[i].name,
                    prov.allPesanan[i].email,
                    prov.allPesanan[i].noTelp,
                    prov.allPesanan[i].alamat,
                    prov.allPesanan[i].namaTari,
                    prov.allPesanan[i].jumlahPenari.toString(),
                    prov.allPesanan[i].tanggal.toString(),
                  ),
                ),
    );
  }
}
