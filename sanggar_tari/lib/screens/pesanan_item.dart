import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sanggar_tari/models/pesanan_tari.dart';
import 'package:sanggar_tari/screens/editPesanan.dart';
import 'package:sanggar_tari/services/database_service.dart';
import 'package:sanggar_tari/services/pesanan.dart';

class PesananItem extends StatelessWidget {
  final String id,
      name,
      alamat,
      noTelp,
      email,
      namaTarian,
      jumlahPenari,
      tanggal;

  PesananItem(this.id, this.name, this.alamat, this.noTelp, this.email,
      this.namaTarian, this.jumlahPenari, this.tanggal);

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<PesananService>(context, listen: false);
    // String date = DateFormat.yMMMd().add_Hms().format(updatedAt);
    return ListTile(
      onTap: () async {
        // Navigator.pushNamed(context, '/editPesanan', arguments: id);

        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return EditPesanan();
        // }));
      },

      leading: CircleAvatar(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: FittedBox(
            child: Text("$name"),
          ),
        ),
      ),
      title: Text("$namaTarian"),
      // subtitle: Text("Last Edited : $date"),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          prov.deletePesanan(id);
        },
      ),
    );
  }
}
