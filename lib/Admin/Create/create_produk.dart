import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lji/Admin/Create/textField.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lji/styles/color.dart';
import 'package:lji/styles/dialog.dart';
import 'package:flutter/services.dart';

class TambahProduk extends StatefulWidget {
  const TambahProduk({super.key});

  @override
  State<TambahProduk> createState() => _TambahProdukState();
}

class _TambahProdukState extends State<TambahProduk> {
  final _formCreateKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController variationController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  String? imagePath;
  String? imageUrl;
  final storage = FirebaseStorage.instance;
  File? image;
  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagePicked =
        await picker.pickImage(source: ImageSource.gallery);
    if (imagePicked != null) {
      imagePath = imagePicked.path;
      image = File(imagePath!);
      setState(() {});
    }
  }

  Future<void> tambahProduk() async {
    try {
      if (imagePath != null) {
        String fileName = DateTime.now().millisecondsSinceEpoch.toString();
        firebase_storage.Reference reference =
            FirebaseStorage.instance.ref('gambar_produk/$fileName');

        await reference.putFile(File(imagePath!));

        // Dapatkan URL gambar setelah berhasil diunggah
        imageUrl = await reference.getDownloadURL();

        // Sekarang, Anda dapat menggunakan imageUrl untuk menyimpan ke Firestore
        print('URL Gambar: $imageUrl');
      }
      // Dapatkan referensi koleksi 'produk'
      CollectionReference produkCollection =
          FirebaseFirestore.instance.collection('produk');

      // Tambahkan data ke Firestore
      await produkCollection.add({
        'nama_produk': nameController.text,
        'gambar_produk':
            imageUrl, // Ganti dengan URL gambar atau menyimpan di Firebase Storage
        'variasi_rasa': variationController.text,
        'harga_produk': int.parse(hargaController.text),
        'kategori_produk': categoryController.text,
        'stok_produk': int.parse(stockController.text),
      });

      // Tambahkan log atau feedback ke pengguna jika berhasil
      print('Produk berhasil ditambahkan ke Firestore');
    } catch (e) {
      // Handle kesalahan jika diperlukan
      print('Error: $e');
    }
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textField = GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black26,
    );
    final text = GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );
    final fieldCreate = BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 240, 240, 240));
    double screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text(
              "Tambah Produk",
              style: GoogleFonts.poppins(
                  fontSize: 25, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)),
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Form(
                key: _formCreateKey,
                child: Column(
                  children: [
                    image != null
                        ? Container(
                            height: 325,
                            width: screenWidth,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                image!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 325,
                            width: screenWidth,
                            child: Opacity(
                                opacity: 0.5,
                                child: Image.asset("assets/picture.png")),
                          ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () async {
                        await getImage();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 50,
                        width: screenWidth,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              image != null
                                  ? "Ganti Gambar"
                                  : "Tambahkan Gambar",
                              style: text,
                            ),
                            Icon(
                              Icons.add_a_photo,
                              color: Color.fromARGB(255, 73, 160, 19),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      cursorColor: greenPrimary,
                      controller: nameController,
                      style: text,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        hintText: "Nama Produk",
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black12, // Default border color
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black, // Default border color
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(
                                255, 73, 160, 19), // Desired focus color
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintStyle: textField,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Nama Produk tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      labelText: "Variasi",
                      hintText: "Leci",
                      controller: variationController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Variasi tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomDropdownField(
                      labelText: "Kategori",
                      dropdownValues: ['Minuman', 'Makanan'],
                      hintText: "Minuman",
                      controller: categoryController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Kategori tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomCurrencyField(
                      labelText: "Harga",
                      hintText: "8.000",
                      controller: hargaController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Harga tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomNumberField(
                      labelText: "Stok",
                      hintText: "100",
                      controller: stockController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Stok tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (imagePath == null) {
                          // Tampilkan pesan kesalahan jika gambar tidak dipilih
                          showDialog(
                            context: context,
                            builder: (context) => WarningDialog(
                              title: "Error",
                              content: "Silakan pilih gambar terlebih dahulu.",
                              buttonConfirm: "Ok",
                              onButtonConfirm: () {
                                Navigator.pop(context);
                              },
                            ),
                          );
                        } else if (_formCreateKey.currentState?.validate() ??
                            false) {
                          // Form valid, proceed with further actions
                          Navigator.pop(context);
                          tambahProduk();
                          showDialog(
                            context: context,
                            builder: (context) => SucessDialog(
                              title: "Berhasil",
                              content: "Item berhasil ditambahkan",
                              buttonConfirm: "Ok",
                              onButtonConfirm: () {
                                Navigator.pop(context);
                              },
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Tambah Produk',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(
                            255, 73, 160, 19), // Warna teks pada tombol
                        padding: EdgeInsets.all(16.0), // Padding tombol
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(15), // Bentuk tepi tombol
                        ),
                        minimumSize: Size(screenWidth, 60),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
