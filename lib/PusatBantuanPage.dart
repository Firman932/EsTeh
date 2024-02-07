import 'package:flutter/material.dart';

class PusatBantuanPage extends StatelessWidget {
  const PusatBantuanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pusat Bantuan",
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
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pertanyaan yang Sering Diajukan",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // FAQ list
            Expanded(
              child: ListView(
                children: [
                  FAQItem(
                    question: "Bagaimana cara mengganti bahasa?",
                    answer: "Anda dapat mengganti bahasa di Pengaturan Umum.",
                  ),
                  FAQItem(
                    question: "Bagaimana cara memperbarui tema aplikasi?",
                    answer: "Kunjungi Pengaturan Umum dan pilih opsi Tema.",
                  ),
                  FAQItem(
                    question:
                        "Dapatkah saya menggunakan aplikasi tanpa koneksi internet?",
                    answer:
                        "Ya, sebagian besar fitur dapat digunakan tanpa koneksi internet. Namun, beberapa fitur mungkin memerlukan koneksi internet.",
                  ),
                  FAQItem(
                    question:
                        "Bagaimana cara mengatur ulang kata sandi yang terlupakan?",
                    answer:
                        "Buka Pengaturan Akun dan pilih opsi 'Lupa Kata Sandi'.",
                  ),
                  // Tambahkan lebih banyak pertanyaan yang sering diajukan jika diperlukan
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Hubungi Dukungan",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Contact support form or details
            ListTile(
              title: Text("Kirim Permintaan Dukungan"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Logika untuk menavigasi ke formulir permintaan dukungan
              },
            ),
            ListTile(
              title: Text("Obrolan dengan Dukungan"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Logika untuk memulai obrolan dengan dukungan
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
            // Additional settings options
            ListTile(
              title: Text("Pengaturan Privasi"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Logika untuk menavigasi ke pengaturan privasi
              },
            ),
            ListTile(
              title: Text("Pengaturan Akun"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Logika untuk menavigasi ke pengaturan akun
              },
            ),
            ListTile(
              title: Text("Preferensi Notifikasi"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Logika untuk mengelola preferensi notifikasi
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(question),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(answer),
        ),
      ],
    );
  }
}
