import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lji/Admin/Create/textField.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProduk extends StatefulWidget {
  final String namaProduk;
  final String varianProduk;
  final String hargaProduk;
  final String stokProduk;
  final ImageProvider<Object> image;

  const UpdateProduk({
    Key? key,
    required this.namaProduk,
    required this.hargaProduk,
    required this.stokProduk,
    required this.image,
    required this.varianProduk,
  }) : super(key: key);

  @override
  State<UpdateProduk> createState() => _UpdateProdukState();
}

class _UpdateProdukState extends State<UpdateProduk> {
  TextEditingController nameController = TextEditingController();
  TextEditingController variationController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  File? image;

  @override
  void initState() {
    super.initState();
    nameController.text = widget.namaProduk;
    variationController.text = widget.varianProduk;
    stockController.text = widget.stokProduk;
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
                        height: 325,
                        width: screenWidth,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                              image: widget.image,
                              fit: BoxFit.cover,
                            )),
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 50,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    style: text,
                    decoration: InputDecoration(
                      hintText: "Nama Produk",
                      border: InputBorder.none,
                      hintStyle: textField,
                    ),
                    controller: nameController,
                  ),
                ),
                SizedBox(height: 10),
                CustomTextField(
                  labelText: "Variasi",
                  hintText: "Leci",
                  controller: variationController,
                ),
                SizedBox(height: 10),
                CustomDropdownField(
                  labelText: "Kategori",
                  dropdownValues: ['Makanan', 'Minuman'],
                  hintText: "Minuman",
                  controller: TextEditingController(text: "Minuman"),
                ),
                SizedBox(height: 10),
                CustomTextField(
                  labelText: "Stok",
                  hintText: "100",
                  controller: stockController,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle update logic here
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
    );
  }
}
