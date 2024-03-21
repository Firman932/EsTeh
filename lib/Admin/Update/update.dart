import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lji/Admin/Create/textField.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lji/styles/color.dart';
import 'package:lji/styles/dialog.dart';

class UpdateProduk extends StatefulWidget {
  final String namaProduk;
  final String kategoriProduk;
  final String varianProduk;
  final String hargaProduk;
  final String stokProduk;
  final String gambarUrl;
  final String documentId;

  const UpdateProduk({
    Key? key,
    required this.namaProduk,
    required this.hargaProduk,
    required this.stokProduk,
    required this.varianProduk,
    required this.gambarUrl,
    required this.documentId,
    required this.kategoriProduk,
  }) : super(key: key);

  @override
  State<UpdateProduk> createState() => _UpdateProdukState();
}

class _UpdateProdukState extends State<UpdateProduk> {
  final _formUpdateKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController variationController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  String? imagePath;
  String? imageUrl;
  File? image;

  @override
  void initState() {
    super.initState();
    nameController.text = widget.namaProduk;
    categoryController.text = widget.kategoriProduk;
    variationController.text = widget.varianProduk;
    stockController.text = widget.stokProduk;
    hargaController.text = widget.hargaProduk;
  }

  Future<void> updateProduct() async {
    try {
      // Ambil referensi dokumen produk dari Firestore
      final CollectionReference produkCollection =
          FirebaseFirestore.instance.collection('produk');

      // Jika gambar berubah, upload gambar baru ke Firebase Storage
      imageUrl = image
          .toString(); // Tetap gunakan URL gambar saat ini jika gambar tidak diubah
      if (image != null) {
        // Upload gambar baru ke Firebase Storage
        final imagePath = 'produk_images/${widget.documentId}.jpg';
        UploadTask uploadTask =
            FirebaseStorage.instance.ref().child(imagePath).putFile(image!);

        // Tunggu hingga proses upload selesai
        TaskSnapshot snapshot = await uploadTask.whenComplete(() {});

        // Dapatkan URL gambar yang baru diunggah
        imageUrl = await snapshot.ref.getDownloadURL();
      } else {
        // Gunakan URL gambar yang sudah ada jika gambar tidak diubah
        imageUrl = widget.gambarUrl;
      }

      // Lakukan pembaruan data berdasarkan ID dokumen
      await produkCollection.doc(widget.documentId).update({
        'nama_produk': nameController.text,
        'kategori_produk': categoryController.text,
        'variasi_rasa': variationController.text,
        'harga_produk': int.parse(hargaController.text),
        'stok_produk': int.parse(stockController.text),
        'gambar_produk': imageUrl,
        // Tambahkan field lain sesuai kebutuhan
      });

      // Jika gambar berubah, upload gambar baru
      if (image != null) {
        // Implementasi upload gambar ke storage atau ke tempat yang sesuai
        // ...
      }

      // Tampilkan pesan sukses atau lakukan navigasi ke halaman lain
    } catch (error) {
      // Tampilkan pesan atau lakukan penanganan kesalahan sesuai kebutuhan
      print('Error updating product: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Terjadi kesalahan saat memperbarui produk'),
        ),
      );
    }
  }

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagePicked =
        await picker.pickImage(source: ImageSource.gallery);
    if (imagePicked != null) {
      image = File(imagePicked.path);
      setState(() {});
    }
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
    double screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Update Produk",
            style:
                GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Form(
              key: _formUpdateKey,
              child: Column(
                children: [
                  image != null
                      ? Container(
                          height: 350,
                          width: screenWidth,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              image!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () async {
                            await _showImageDetailDialog(context);
                          },
                          child: Container(
                            height: 325,
                            width: screenWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                widget.gambarUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                  SizedBox(height: 20),
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
                        border: Border.all(color: Colors.black),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Ganti Gambar",
                            style: text,
                          ),
                          Icon(
                            Icons.add_a_photo,
                            color: Color.fromARGB(255, 73, 160, 19),
                          ),
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
                  SizedBox(height: 10),
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
                  SizedBox(height: 10),
                  CustomDropdownField(
                    labelText: "Kategori",
                    dropdownValues: ['Makanan', 'Minuman'],
                    hintText: "Minuman",
                    controller: categoryController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Kategori tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  CustomCurrencyField(
                    labelText: "Harga",
                    hintText: "8000",
                    controller: hargaController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Harga tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
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
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formUpdateKey.currentState?.validate() ?? false) {
                        // Form valid, proceed with further actions
                        Navigator.pop(context);
                        updateProduct();
                        showDialog(
                          context: context,
                          builder: (context) => SucessDialog(
                            title: "Berhasil",
                            content: "Item berhasil dirubah",
                            buttonConfirm: "Ok",
                            onButtonConfirm: () {
                              Navigator.pop(context);
                            },
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Update Produk',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 73, 160, 19),
                      padding: EdgeInsets.all(16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      minimumSize: Size(screenWidth, 70),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showImageDetailDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              widget.gambarUrl,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
