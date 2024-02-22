import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lji/Admin/Create/create_produk.dart';
import 'package:lji/Admin/Dashboard/filter.dart';
import 'package:lji/Admin/History/history.dart';
import 'package:lji/Admin/Notifikasi/notifikasi.dart';
import 'package:lji/Admin/Stok/list_produk.dart';
import 'package:lji/Admin/dialog.dart';
import 'package:lji/filterUser.dart';

class StokProduk extends StatefulWidget {
  const StokProduk({super.key});

  @override
  State<StokProduk> createState() => _StokProdukState();
  static _StokProdukState of(BuildContext context) =>
      context.findAncestorStateOfType<_StokProdukState>()!;
}

class _StokProdukState extends State<StokProduk> {
  TextEditingController _numberController = TextEditingController();
  int _number = 0;
  int _max = 3;
  bool isChecklistMode = false;
  bool isAllChecked = false;
  bool checkAll = false;
  List<bool> isCheckedList =
      List.generate(6, (index) => false); // Ganti jumlah item sesuai kebutuhan

  @override
  void initState() {
    super.initState();
    _numberController.text = '$_number';
  }

  void _updateNumber() {
    setState(() {
      _number = int.tryParse(_numberController.text) ?? 0;
    });
  }

  bool isAnyItemChecked() {
    return isCheckedList.contains(true);
  }

  void _increment() {
    setState(() {
      _number++;
      _numberController.text = '$_number';
    });
  }

  void _decrement() {
    setState(() {
      if (_number > 0) {
        _number--;
        _numberController.text = '$_number';
      }
    });
  }

  void ubahItem() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Tambah Produk",
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w500)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: _decrement,
                  ),
                  Container(
                    width: 60,
                    height: 30,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: TextField(
                      decoration: InputDecoration(border: InputBorder.none),
                      controller: _numberController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      onChanged: (value) => _updateNumber(),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: _increment,
                  ),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Batal")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          builder: (context) => SucessDialog(),
                        );
                      },
                      child: Text("Konfirmasi"))
                ],
              )
            ],
          ),
        );
      },
    );
  }

  void hapusItem() {}

  void activateChecklistMode() {
    setState(() {
      isChecklistMode = true;
      isAllChecked = false;
    });
  }

  void deactivateChecklistMode() {
    setState(() {
      isChecklistMode = false;
      toggleCheckAll(false);
      print("Fungsi ini dipanggil");
    });
  }

  void toggleCheckAll(bool value) {
    setState(() {
      isCheckedList = List.generate(isCheckedList.length, (index) => value);
      isAllChecked = value;
    });
  }

  void toggleItemCheck(int index) {
    setState(() {
      isCheckedList[index] = !isCheckedList[index];
      // Cek apakah semua item sudah terpilih
      bool allChecked = isCheckedList.every((isChecked) => isChecked);

      // Set nilai checkAll berdasarkan kondisi
      checkAll = allChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          bottomNavigationBar: isAnyItemChecked()
              ? BottomAppBar(
                  elevation: 1,
                  shadowColor: Colors.black,
                  surfaceTintColor: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: ubahItem,
                        child: Text('Ubah'),
                      ),
                      ElevatedButton(
                        onPressed: hapusItem,
                        child: Text('Hapus'),
                      ),
                    ],
                  ),
                )
              : null,
          appBar: AppBar(
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Riwayat(),
                    ),
                  );
                },
                child: Icon(
                  Icons.history,
                  size: 25,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Notifikasi(),
                    ),
                  );
                },
                child: Icon(
                  Icons.notifications,
                  size: 25,
                ),
              ),
              SizedBox(
                width: 13,
              )
            ],
            centerTitle: true,
            title: Text(
              "Produk",
              style: GoogleFonts.poppins(
                  fontSize: 25, fontWeight: FontWeight.w500),
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Filter(),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isChecklistMode
                        ? Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    checkAll = false;
                                  });
                                  deactivateChecklistMode();
                                },
                                icon: Icon(Icons.close),
                              ),
                              Text("Batal")
                            ],
                          )
                        : Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(
                                        156, 156, 156, 0.28999999165534973),
                                    offset: Offset(0, 0),
                                    blurRadius: 55.5,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Search',
                                          border: InputBorder.none,
                                          icon: Icon(Icons.search),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                    isChecklistMode
                        ? Row(
                            children: [
                              Checkbox(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                activeColor: Color.fromRGBO(73, 160, 19, 1),
                                value: checkAll,
                                onChanged: (value) {
                                  setState(() {
                                    checkAll = value!;
                                  });
                                  toggleCheckAll(value!);
                                },
                              ),
                              SizedBox(
                                width: 15,
                              )
                            ],
                          )
                        : Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.filter_list_rounded),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TambahProduk(),
                                      ),
                                    );
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromRGBO(73, 160, 19, 1),
                                      minimumSize: Size(30, 30),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))))
                            ],
                          ),
                  ],
                ),
                // SearchFilter(
                //   isChecklistMode: isChecklistMode,
                //   onCheckAll: toggleCheckAll,
                //   onCancel: deactivateChecklistMode,
                //   a: false,
                // ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  indent: 0,
                  height: 1,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 6, // Ganti dengan jumlah item yang sesuai
                    itemBuilder: (context, index) {
                      return ListProduk(
                        isChecklistMode: isChecklistMode,
                        isChecked: isCheckedList[index],
                        onToggleCheck: () {
                          toggleItemCheck(index);
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}
