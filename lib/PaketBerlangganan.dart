import 'package:flutter/material.dart';

class PaketBerlanggananPage01 extends StatelessWidget {
  final String namaFile;

  const PaketBerlanggananPage01({Key? key, required this.namaFile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Berlangganan Paket"),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.width * 0.05,
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
        padding: EdgeInsets.all(30.0),
        child: ListView(
          children: [
            Text(
              "Berlangganan Paket untuk $namaFile",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text("Premium Bulanan"),
              subtitle: Text("Rp 50.000/bulan"),
              trailing: ElevatedButton(
                onPressed: () {
                  // Tambahkan logika untuk berlangganan premium bulanan
                },
                child: Text("Berlangganan"),
              ),
            ),
            ListTile(
              title: Text("Premium Tahunan"),
              subtitle: Text("Rp 500.000/tahun"),
              trailing: ElevatedButton(
                onPressed: () {
                  // Tambahkan logika untuk berlangganan premium tahunan
                },
                child: Text("Berlangganan"),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Manfaat Berlangganan",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text("Akses ke Fitur Premium"),
              subtitle: Text(
                  "Nikmati fitur eksklusif hanya untuk pelanggan premium."),
            ),
            ListTile(
              title: Text("Tidak Ada Iklan"),
              subtitle: Text("Nikmati pengalaman tanpa iklan yang mengganggu."),
            ),
            SizedBox(height: 20),
            Text(
              "Pembayaran",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text("Metode Pembayaran"),
              subtitle: Text("Pilih metode pembayaran yang tersedia."),
            ),
            SizedBox(height: 20),
            Text(
              "Kebijakan Pembatalan",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text("Batal Kapan Saja"),
              subtitle:
                  Text("Batal berlangganan kapan saja tanpa biaya tambahan."),
            ),
          ],
        ),
      ),
    );
  }
}
