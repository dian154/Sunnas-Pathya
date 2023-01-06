import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sanggar_tari/models/pesanan_tari.dart';
import 'package:sanggar_tari/services/Pesanan.dart';

class EditPesanan extends StatelessWidget {
  // static const route = "/edit-pesanantari";

  @override
  Widget build(BuildContext context) {
    String prodId = ModalRoute.of(context)?.settings.arguments as String;

    var prov = Provider.of<PesananService>(context, listen: false);

    var selectedPesanan = prov.selectById(prodId);

    final TextEditingController nameController =
        TextEditingController(text: selectedPesanan.name);
    final TextEditingController emailController =
        TextEditingController(text: selectedPesanan.email);
    final TextEditingController noTelpController =
        TextEditingController(text: selectedPesanan.noTelp);
    final TextEditingController alamatController =
        TextEditingController(text: selectedPesanan.alamat);
    final TextEditingController namaTarianController =
        TextEditingController(text: selectedPesanan.namaTari);
    final TextEditingController jumlahPenariController =
        TextEditingController(text: selectedPesanan.jumlahPenari);
    final TextEditingController tanggalController =
        TextEditingController(text: selectedPesanan.tanggal);

    void edit(
      String name,
      String email,
      String noTelp,
      String alamat,
      String namaTarian,
      String jumlahPenari,
      String tanggal,
    ) {
      prov.editPesanan(prodId, name, email, noTelp, alamat, namaTarian,
          jumlahPenari, tanggal);
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Pesanan Tari"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => edit(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextField(
                  autocorrect: false,
                  autofocus: true,
                  controller: nameController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Nama Lenkap",
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
                    labelText: "Nomor Telepon",
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
                    labelText: "Nama Tarian",
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
                    labelText: "Jumlah Penari",
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
                    labelText: "Tanggal",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 30),
              child: ElevatedButton(
                onPressed: () => edit(
                    nameController.text,
                    emailController.text,
                    noTelpController.text,
                    alamatController.text,
                    namaTarianController.text,
                    jumlahPenariController.text,
                    tanggalController.text),
                child: Text(
                  "Edit Pesanan",
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
    );
  }
}
