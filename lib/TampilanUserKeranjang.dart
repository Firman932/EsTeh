import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItem {
  bool isChecked;

  CartItem({required this.isChecked});
}

class KeranjangPage02 extends StatefulWidget {
  KeranjangPage02({super.key});

  @override
  State<KeranjangPage02> createState() => KeranjangPage01();
}

class KeranjangPage01 extends State<KeranjangPage02> {
  TextEditingController _controller = TextEditingController();
  int _HargaUnit = 8000;
  int _nol = 0;
  bool _MaksimalReached = false;
  bool _isEditing =
      false; // Menambahkan variabel untuk mengetahui apakah sedang dalam mode pengeditan
  bool _isTotalDisabled =
      false; // Menambahkan variabel untuk mengetahui apakah teks total harus dinonaktifkan

  List<CartItem> cartItems =
      List.generate(10, (index) => CartItem(isChecked: false));

  @override
  void initState() {
    super.initState();
    _controller.text = '$_nol'; // Set nilai awal teks
  }

  void _updateTotalPrice() {
    setState(() {
      _nol = int.tryParse(_controller.text) ?? 0;
      if (_nol > 99) {
        _nol = 100;
        _controller.text = '$_nol';
        _MaksimalReached = true;
      } else {
        _MaksimalReached = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Keranjang',
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  height: 3,
                  color: Color(0xff000000),
                ),
              ),
              SizedBox(width: 5),
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: _isEditing ? Colors.red : Color(0xFF49A013),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '${cartItems.where((item) => item.isChecked).length}',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isEditing = !_isEditing; // Toggle mode pengeditan
                  _isTotalDisabled =
                      _isEditing; // Menonaktifkan teks total saat mode pengeditan aktif
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                margin: EdgeInsets.only(right: 10),
                child: Text(
                  _isEditing
                      ? 'Selesai'
                      : 'Ubah', // Ganti teks berdasarkan mode pengeditan
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                height: 90,
                child: Row(
                  children: [
                    Checkbox(
                      value: cartItems.every((item) => item.isChecked),
                      onChanged: (value) {
                        setState(() {
                          cartItems.forEach((item) {
                            item.isChecked = value!;
                          });
                        });
                      },
                      visualDensity: VisualDensity(
                        horizontal:
                            -4.0, // Atur nilai horizontal untuk mengatur lebar Checkbox
                        vertical:
                            -4.0, // Atur nilai vertical untuk mengatur tinggi Checkbox
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            5), // Ubah nilai radius sesuai keinginan
                        side: BorderSide.none, // Hilangkan border samping
                      ),
                      activeColor: _isEditing
                          ? Colors.red
                          : Color(0xFF49A013), // Warna saat dicentang
                      checkColor: Colors.white, // Warna centang
                    ),
                    Text(
                      'Semua',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 116,
                        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(156, 156, 156, 0.29),
                              offset: Offset(2, 2),
                              blurRadius: 10,
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: cartItems[index].isChecked,
                                    onChanged: (value) {
                                      setState(() {
                                        cartItems[index].isChecked = value!;
                                      });
                                    },
                                    visualDensity: VisualDensity(
                                      horizontal:
                                          -4.0, // Atur nilai horizontal untuk mengatur lebar Checkbox
                                      vertical:
                                          -4.0, // Atur nilai vertical untuk mengatur tinggi Checkbox
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          5), // Ubah nilai radius sesuai keinginan
                                      side: BorderSide
                                          .none, // Hilangkan border samping
                                    ),
                                    activeColor: _isEditing
                                        ? Colors.red
                                        : Color(
                                            0xFF49A013), // Warna saat dicentang
                                    checkColor: Colors.white, // Warna centang
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: AssetImage("assets/esteh.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  _buildTextInfo(),
                                ],
                              ),
                              _buildActions(context, index),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _isEditing
            ? BottomAppBar(
                shape: CircularNotchedRectangle(),
                color: Colors.white,
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 6, 5, 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total : RP ${_nol * _HargaUnit}',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: _isTotalDisabled
                              ? Colors.transparent
                              : Colors.black,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Action when the delete button is pressed
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: Text(
                          'Hapus',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : BottomAppBar(
                shape: CircularNotchedRectangle(),
                color: Colors.white,
                child: Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(5, 6, 5, 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total : RP ${_nol * _HargaUnit}',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color:
                                _isTotalDisabled ? Colors.grey : Colors.black,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Action when the checkout button is pressed
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff4fb60e),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: Text(
                            'Checkout',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
  }

  Widget _buildTextInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Es Teh",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Rasa Taro",
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "Rp.8000",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildActions(BuildContext context, int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: Image.asset(
            "assets/minus.png",
            width: 25,
          ),
          onPressed: () {
            if (_nol > 0) {
              setState(() {
                _nol--;
                _controller.text = '$_nol';
                _updateTotalPrice();
              });
            }
          },
        ),
        IntrinsicWidth(
          child: TextField(
            autofocus: false,
            controller: _controller,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              _updateTotalPrice();
            },
            style: TextStyle(
              fontSize: 16,
            ),
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            enabled: !_MaksimalReached,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
        IconButton(
          icon: Image.asset(
            "assets/plus.png",
            width: 26,
          ),
          onPressed: () {
            if (!_MaksimalReached) {
              setState(() {
                _nol++;
                _controller.text = '$_nol';
                _updateTotalPrice();
              });
            }
          },
        ),
      ],
    );
  }
}
