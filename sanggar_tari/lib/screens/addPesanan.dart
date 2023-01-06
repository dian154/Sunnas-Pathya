import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sanggar_tari/services/pesanan.dart';

import '../services/database_service.dart';

class AddPesanan extends StatelessWidget {
  static const route = "/add-Pesanan";

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noTelpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController namaTarianController = TextEditingController();
  final TextEditingController jumlahPenariController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void save(String name, String email, String noTelp, String alamat,
        String namaTarian, String jumlahPenari, String tanggal) {
      Provider.of<PesananService>(context, listen: false)
          .addPesanan(
              name, email, noTelp, alamat, namaTarian, jumlahPenari, tanggal)
          .catchError((onError) {
        print(onError);
        return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Error Occured"),
              content: Text("Error : $onError"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("OKAY"),
                ),
              ],
            );
          },
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Menambahkan Pesanan Tari"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => save(
                nameController.text,
                emailController.text,
                noTelpController.text,
                alamatController.text,
                namaTarianController.text,
                jumlahPenariController.text,
                tanggalController.text),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 8),
                      TextField(
                        autocorrect: false,
                        autofocus: true,
                        controller: nameController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: "Nama Lengkap",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        autocorrect: false,
                        controller: emailController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        autocorrect: false,
                        controller: noTelpController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          labelText: "Nomor Telephone",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        autocorrect: false,
                        controller: alamatController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          labelText: "Alamat",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        autocorrect: false,
                        controller: namaTarianController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          labelText: "Paket Rumah Inap",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        autocorrect: false,
                        controller: jumlahPenariController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          labelText: "Item Makanan",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        autocorrect: false,
                        controller: tanggalController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          labelText: "Tanggal Penyewaan",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 30),
                child: ElevatedButton(
                  onPressed: () => save(
                      namaTarianController.text,
                      emailController.text,
                      noTelpController.text,
                      alamatController.text,
                      namaTarianController.text,
                      jumlahPenariController.text,
                      tanggalController.text),
                  child: Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
