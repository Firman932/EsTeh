import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lji/styles/dialog.dart';

class CartItem {
  bool isChecked;

  CartItem({required this.isChecked});
}

class KeranjangPage02 extends StatefulWidget {
  KeranjangPage02({Key? key});

  @override
  State<KeranjangPage02> createState() => KeranjangPage01();
}

class KeranjangPage01 extends State<KeranjangPage02> {
  TextEditingController _controller = TextEditingController();
  int _HargaUnit = 8000;
  int _nol = 0;
  bool _MaksimalReached = false;
  bool _isEditing = false;
  bool _isTotalDisabled = false;
  List<CartItem> cartItems =
      List.generate(10, (index) => CartItem(isChecked: false));

  @override
  void initState() {
    super.initState();
    _controller.text = '$_nol';
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
                _isEditing = !_isEditing;
                _isTotalDisabled = _isEditing;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              margin: EdgeInsets.only(right: 10),
              child: Text(
                _isEditing ? 'Selesai' : 'Ubah',
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
                      horizontal: -4.0,
                      vertical: -4.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide.none,
                    ),
                    activeColor: _isEditing ? Colors.red : Color(0xFF49A013),
                    checkColor: Colors.white,
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
                                    horizontal: -4.0,
                                    vertical: -4.0,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: BorderSide.none,
                                  ),
                                  activeColor: _isEditing
                                      ? Colors.red
                                      : Color(0xFF49A013),
                                  checkColor: Colors.white,
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
                      'Total : Rp ${_nol * _HargaUnit >= 0 ? _nol * _HargaUnit : 0}',
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
                        showDialog(
                          context: context,
                          builder: (context) => DeleteDialog(
                            title: 'Peringatan',
                            content:
                                'Apakah kamu yakin ingin menghapus list keranjangmu ?',
                            buttonConfirm: 'Ok',
                            onButtonConfirm: () {
                              Navigator.pop(context);
                            },
                            buttonCancel: 'Cancel',
                            onButtonCancel: () {},
                          ),
                        );
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
                          color: _isTotalDisabled ? Colors.grey : Colors.black,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => SucessDialog(
                              title: 'Sukses',
                              content:
                                  'Transaksi telah berhasil terima kasih telah berbelanja di toko kami !',
                              buttonConfirm: 'Ok',
                              onButtonConfirm: () {
                                Navigator.pop(context);
                              },
                            ),
                          );
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
            ),
    );
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
              if (int.tryParse(value) != null) {
                _updateTotalPrice();
              }
            },
            style: GoogleFonts.poppins(
              fontSize: 18,
            ),
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            enabled:
                !_isTotalDisabled, // Nonaktifkan TextField jika batas maksimum tercapai
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero, // Hapus padding bawaan
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
