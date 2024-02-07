import 'package:flutter/material.dart';

class MasaAktifBerlanggananPage extends StatelessWidget {
  const MasaAktifBerlanggananPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Masa Aktif Berlangganan",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFFfe1101),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Detail Langganan",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text("Langganan Saat Ini"),
              subtitle: Text("Paket Premium - Bulanan"),
            ),
            ListTile(
              title: Text("Status Langganan"),
              subtitle: Text("Aktif"),
            ),
            ListTile(
              title: Text("Tanggal Perpanjangan Selanjutnya"),
              subtitle: Text("15 Februari 2024"),
            ),
            SizedBox(height: 20),
            Text(
              "Opsi Perpanjangan",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text("Frekuensi Perpanjangan"),
              subtitle: Text("Bulanan"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Tambahkan logika untuk mengubah frekuensi perpanjangan
              },
            ),
            ListTile(
              title: Text("Ganti Paket"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Tambahkan logika untuk mengubah paket langganan
              },
            ),
            SizedBox(height: 20),
            Text(
              "Pengaturan Tambahan",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text("Metode Pembayaran"),
              subtitle: Text("Kartu Kredit berakhir dengan **** 1234"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Tambahkan logika untuk mengelola metode pembayaran
              },
            ),
            ListTile(
              title: Text("Histori Tagihan"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Tambahkan logika untuk melihat histori tagihan
              },
            ),
            ListTile(
              title: Text("Batalkan Langganan"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Tambahkan logika untuk membatalkan langganan
              },
            ),
          ],
        ),
      ),
    );
  }
}
