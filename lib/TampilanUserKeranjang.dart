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
      List.generate(10000, (index) => CartItem(isChecked: false));

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
            size: 23,
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
                fontSize: 22,
                fontWeight: FontWeight.w500,
                height: 3,
                color: Color(0xff000000),
              ),
            ),
            SizedBox(width: 3),
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: _isEditing ? Colors.red : Color(0xFF49A013),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '${cartItems.where((item) => item.isChecked).length}',
                style: GoogleFonts.poppins(
                  fontSize: 13,
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
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              margin: EdgeInsets.only(right: 10),
              child: Text(
                _isEditing ? 'Selesai' : 'Ubah',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff000000),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(8),
              height: 60,
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
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff000000),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card.filled(
                    shadowColor: Color(0x499c9c9c),
                    elevation: 5,
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
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
                              activeColor:
                                  _isEditing ? Colors.red : Color(0xFF49A013),
                              checkColor: Colors.white,
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage("assets/esteh.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Es Teh',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                                Text(
                                  'Rasa Taro',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 9),
                                ),
                                Text(
                                  'Rp.8000',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ]),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(Icons.do_not_disturb_on_outlined),
                                iconSize: 22,
                                color: Color(0xFF49A013),
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
                                // Ubah lebar TextField sesuai kebutuhan Anda
                                child: TextField(
                                  autofocus: false,
                                  cursorColor: Color(0xff49A013),

                                  controller: _controller,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    if (int.tryParse(value) != null) {
                                      _updateTotalPrice();
                                    }
                                  },
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                  ),
                                  textInputAction: TextInputAction.next,
                                  textCapitalization: TextCapitalization.none,

                                  enabled:
                                      !_MaksimalReached, // Nonaktifkan TextField jika batas maksimum tercapai
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff49A013))),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff49A013)))),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.add_circle_outline),
                                iconSize: 22,
                                color: Color(0xFF49A013),
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
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _isEditing
          ? BottomAppBar(
              shape: CircularNotchedRectangle(),
              color: Colors.white,
              elevation: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(5, 6, 5, 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Text(
                        'Hapus',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : BottomAppBar(
              elevation: 1,
              shape: CircularNotchedRectangle(),
              color: Colors.white,
              child: Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 6, 5, 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(children: [
                        Text(
                          'Total : RP ${_nol * _HargaUnit}',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color:
                                _isTotalDisabled ? Colors.grey : Colors.black,
                          ),
                        ),
                      ]),
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
                          backgroundColor: Color(0xff4fb60e),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: Text(
                          'Checkout',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 13,
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
}
