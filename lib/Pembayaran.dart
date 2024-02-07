import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PembayaranPage extends StatefulWidget {
  const PembayaranPage({Key? key}) : super(key: key);

  @override
  _PembayaranPageState createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  String metodePembayaranTerpilih = "Kartu Kredit";
  List<String> items = ["Item 1", "Item 2", "Item 3"];
  double totalHarga = 150000.00;

  @override
  Widget build(BuildContext context) {
    // Membuat objek untuk format mata uang Rupiah
    final formatCurrency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pembayaran",
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
              "Ringkasan Item",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Menampilkan daftar item yang dipilih
            ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                  subtitle: Text(
                    formatCurrency.format(50000),
                  ), // Menggunakan format mata uang Rupiah
                );
              },
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            // Menampilkan total harga
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  formatCurrency.format(totalHarga),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Metode Pembayaran",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Menampilkan daftar metode pembayaran dengan tombol radio
            Column(
              children: [
                RadioListTile(
                  title: Text("Kartu Kredit"),
                  value: "Kartu Kredit",
                  groupValue: metodePembayaranTerpilih,
                  onChanged: (value) {
                    setState(() {
                      metodePembayaranTerpilih = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text("PayPal"),
                  value: "PayPal",
                  groupValue: metodePembayaranTerpilih,
                  onChanged: (value) {
                    setState(() {
                      metodePembayaranTerpilih = value.toString();
                    });
                  },
                ),
                // Tambahkan metode pembayaran lain sesuai kebutuhan
              ],
            ),
            SizedBox(height: 20),
            // Tombol untuk melanjutkan pembayaran
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk melanjutkan pembayaran
              },
              child: Text("Lanjutkan ke Pembayaran"),
            ),
          ],
        ),
      ),
    );
  }
}
