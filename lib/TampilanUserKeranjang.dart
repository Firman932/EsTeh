import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lji/styles/dialog.dart';

class CartItem {
  bool isChecked;
  String productId;
  String productImage;
  String productName;
  String productVariation;
  int quantity;
  int price;

  CartItem({
    required this.isChecked,
    required this.productId,
    required this.productImage,
    required this.productName,
    required this.productVariation,
    required this.quantity,
    required this.price,
  });
}

class KeranjangPage02 extends StatefulWidget {
  KeranjangPage02({Key? key});

  @override
  State<KeranjangPage02> createState() => KeranjangPage01();
}

class KeranjangPage01 extends State<KeranjangPage02> {
  bool _isEditing = false;
  bool _isTotalDisabled = false;
  List<CartItem> cartItems = [];

  @override
  void initState() {
    super.initState();
    _loadCartItems();
  }

  void _loadCartItems() async {
    String? userID;
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      userID = user.uid;
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userID)
          .get();

      List<CartItem> items = [];
      List<dynamic> cart = userDoc['cart'];

      for (var item in cart) {
        DocumentSnapshot productDoc = await FirebaseFirestore.instance
            .collection('produk')
            .doc(item['product_id'])
            .get();

        // Check if the product document exists
        if (productDoc.exists) {
          items.add(CartItem(
            productId: item['product_id'],
            productName: productDoc['nama_produk'],
            productVariation: productDoc['variasi_rasa'],
            quantity: item['jumlah'],
            price: productDoc['harga_produk'],
            isChecked: false,
            productImage: productDoc['gambar_produk'],
          ));
        } else {
          // Handle the case where the product has been deleted
          print('Product with ID ${item['product_id']} no longer exists');

          // Optionally, remove the item from the user's cart in Firestore
          await _removeProductFromCart(item['product_id']);
        }
      }

      setState(() {
        cartItems = items;
        if (!_isEditing) {
          for (var item in cartItems) {
            item.isChecked = false;
          }
        }
      });
    }
  }

  Future<void> _removeProductFromCart(String productId) async {
    // Get user ID from the authenticated user
    String? userID;
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      userID = user.uid;

      try {
        // Get the user's cart data
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(userID)
            .get();

        List<dynamic> updatedCart = List.from(userDoc['cart']);

        // Remove the item with the specified product_id from the user's cart
        updatedCart.removeWhere((item) => item['product_id'] == productId);

        // Update the cart in Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userID)
            .update({'cart': updatedCart});

        print('Product removed from the cart');

        // Print the current cart after removal for debugging purposes
        DocumentSnapshot updatedUserDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(userID)
            .get();
        print('Updated Cart: ${updatedUserDoc['cart']}');
      } catch (error) {
        print('Error removing product from the cart: $error');
        // Handle error, if needed
      }
    }
  }

  void _updateTotalPrice() async {
    if (cartItems.isEmpty) {
      setState(() {
        _isTotalDisabled = true;
      });
      return;
    }
    // Calculate total price based on selected quantities
    int total = 0;

    // List untuk menyimpan produk yang perlu dihapus
    List<String> productsToDelete = [];

    for (var item in cartItems) {
      if (item.isChecked) {
        total += item.quantity * item.price;
      }
      if (item.quantity == 0) {
        bool deleteConfirmed = await _showDeleteConfirmationDialog(item);
        if (deleteConfirmed) {
          productsToDelete.add(item.productId);
        } else {
          // Jika pengguna menolak hapus, set jumlah kembali ke 1
          item.quantity = 1;
        }
      }
    }

    // Hapus produk dari Firestore
    await _deleteProductsFromFirestore(productsToDelete);

    // Setelah semua pekerjaan asinkron selesai, update state
    setState(() {
      _isTotalDisabled = total <= 0;
      if (cartItems.isEmpty) {
        for (var item in cartItems) {
          item.isChecked = false;
        }
      }
    });
  }

  Future<bool> _showDeleteConfirmationDialog(CartItem cartItem) async {
    bool deleteConfirmed = false;

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Konfirmasi Hapus'),
        content: Text('Apakah Anda yakin ingin menghapus produk ini?'),
        actions: [
          TextButton(
            onPressed: () {
              // Set deleteConfirmed menjadi true dan tutup dialog
              deleteConfirmed = true;
              Navigator.pop(context);
            },
            child: Text('Ya'),
          ),
          TextButton(
            onPressed: () {
              // Set deleteConfirmed menjadi false dan tutup dialog
              deleteConfirmed = false;
              Navigator.pop(context);
            },
            child: Text('Tidak'),
          ),
        ],
      ),
    );

    return deleteConfirmed;
  }

  Future<void> _deleteProductsFromFirestore(List<String> productIds) async {
    // Dapatkan user ID dari pengguna yang sedang diotentikasi
    String? userID;
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      userID = user.uid;

      // Hapus produk dari koleksi cart pada dokumen pengguna
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userID)
          .get();

      List<dynamic> updatedCart = List.from(userDoc['cart']);

      // Hapus item dengan product_id yang ada di dalam productIds
      updatedCart
          .removeWhere((item) => productIds.contains(item['product_id']));

      // Update data di Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userID)
          .update({'cart': updatedCart});
    }
    if (productIds.isNotEmpty) {
      _loadCartItems();
    }
    setState(() {
      cartItems.removeWhere((item) => productIds.contains(item.productId));
    });
  }

  void _deleteSelectedProducts() async {
    List<String> selectedProductIds = [];

    for (var item in cartItems) {
      if (item.isChecked) {
        selectedProductIds.add(item.productId);
      }
    }

    if (selectedProductIds.isNotEmpty) {
      // Hapus produk yang dipilih dari Firestore
      await _deleteProductsFromFirestore(selectedProductIds);

      // Setelah menghapus, load kembali daftar produk
    }
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
        padding: EdgeInsets.all(6),
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
                        _updateTotalPrice();
                      });
                    },
                    visualDensity: VisualDensity(
                      horizontal: -0.0,
                      vertical: -0.0,
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
                  CartItem cartItem = cartItems[index];
                  return Card(
                    shadowColor: Color(0x499c9c9c),
                    elevation: 5,
                    color: Colors.white,
                    surfaceTintColor: Colors.white,
                    margin:
                        EdgeInsets.only(right: 10, left: 10, bottom: 5, top: 5),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                  value: cartItems[index].isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      cartItems[index].isChecked = value!;
                                      _updateTotalPrice();
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
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image:
                                          NetworkImage(cartItem.productImage),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cartItem.productName,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                      Text(
                                        cartItem.productVariation,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 9),
                                      ),
                                      Text(
                                        NumberFormat.currency(
                                                locale: 'id',
                                                symbol: 'Rp ',
                                                decimalDigits: 0)
                                            .format(cartItem.price),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.do_not_disturb_on_outlined),
                                iconSize: 22,
                                color: Color(0xFF49A013),
                                onPressed: () {
                                  if (cartItems[index].quantity > 0) {
                                    setState(() {
                                      cartItems[index].quantity--;
                                      _updateTotalPrice();
                                    });
                                  }
                                },
                              ),
                              IntrinsicWidth(
                                child: Text(
                                  '${cartItems[index].quantity}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF49A013),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.add_circle_outline),
                                iconSize: 22,
                                color: Color(0xFF49A013),
                                onPressed: () {
                                  setState(() {
                                    cartItems[index].quantity++;
                                    _updateTotalPrice();
                                  });
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
          ? Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Color(0x499c9c9c),
                  offset: Offset(0, 0),
                  blurRadius: 2,
                ),
              ]),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
                child: BottomAppBar(
                  height: 70,
                  surfaceTintColor: Colors.white,
                  shape: CircularNotchedRectangle(),
                  color: Colors.white,
                  elevation: 1,
                  notchMargin: 8,
                  clipBehavior: Clip.antiAlias,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                                _deleteSelectedProducts();
                                Navigator.pop(context);
                              },
                              buttonCancel: 'Cancel',
                              onButtonCancel: () {
                                Navigator.pop(context);
                              },
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
              ),
            )
          : Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Color(0x499c9c9c),
                  offset: Offset(0, 0),
                  blurRadius: 2,
                ),
              ]),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: BottomAppBar(
                  surfaceTintColor: Colors.white,
                  height: 70,
                  elevation: 1,
                  notchMargin: 8,
                  shape: CircularNotchedRectangle(),
                  color: Colors.white,
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Text(
                            'Total : ${NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(_isTotalDisabled ? 0 : _calculateTotal())}',
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color:
                                  _isTotalDisabled ? Colors.grey : Colors.black,
                            ),
                          ),
                        ]),
                        _isTotalDisabled ? SizedBox.shrink() 
                        : ElevatedButton(
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
            ),
    );
  }

  int _calculateTotal() {
    int total = 0;
    for (var item in cartItems) {
      if (item.isChecked) {
        total += item.quantity * item.price;
      }
    }
    return total;
  }
}
