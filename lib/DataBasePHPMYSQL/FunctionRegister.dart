import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:lji/Admin/Dashboard/dashboard.dart';
import 'package:lji/FOR%20USER/BagianDashboard.dart';
import 'package:lji/snackbarlogin.dart';
import 'package:mysql1/mysql1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class LOGIN {
  final int? id;
  final String USERNAME;
  final String? sinceMember;
  final String? role; // Add role property

  LOGIN({this.id, required this.USERNAME, this.sinceMember, this.role});
}

class UserController extends GetxController {
  final Rx<LOGIN?> login = Rx<LOGIN?>(null);

  Future<MySqlConnection> connectToDatabase() async {
    final setting = ConnectionSettings(
      host: '10.0.2.2',
      port: 3306,
      user: 'MAMAN93',
      password: 'MUHFIRMANM93',
      db: 'estehnusantara',
    );
    await Future.delayed(Duration(milliseconds: 100));

    final connection = await MySqlConnection.connect(setting);
    return connection;
  }

  // Remove registerUser method

  // Login
  Future<bool> loginUser(String USERNAME, String PASSWORD) async {
    MySqlConnection? conn;
    try {
      conn = await connectToDatabase();
      

      var result = await conn.query(
        'SELECT * FROM login WHERE USERNAME = ? AND PASSWORD = ? ',
        [USERNAME, PASSWORD],
      );

      if (result.isEmpty) {
        showCustomSnackBar(
          "Incorrect username or password",
          title: "Login",
        );
      } else {
        var loginData = result.first;
        var userId = loginData['id'];
        var userRole = loginData['role'];

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('id', userId.toString());
        prefs.setString('USERNAME', loginData['USERNAME']);
        String sinceMemberString = loginData['since_member']?.toString() ?? '';
        prefs.setString('since_member', sinceMemberString);

        login.value = LOGIN(
          id: userId,
          USERNAME: loginData['USERNAME'],
          sinceMember: sinceMemberString,
          role: userRole, // Store the user role
        );

        // Check the user role and navigate accordingly
        if (userRole == 'admin') {
          Get.to(Dashboard()); // Ganti dengan navigasi ke dashboard admin
        } else {
          Get.to(MenuUser()); // Ganti dengan navigasi ke dashboard user
        }
      }
      return true;
    } catch (e) {
      if (kDebugMode) {
        print('Error logging in: $e');
      }
      return false;
    } finally {
      await conn?.close();
    }
  }

  Future<bool> addNewUser(String USERNAME, String PASSWORD, String role) async {
  MySqlConnection? conn;
  try {
    conn = await connectToDatabase();

    // Periksa apakah akun dengan USERNAME tersebut sudah ada
    var existingUserResults = await conn.query(
      'SELECT * FROM login WHERE USERNAME = ?',
      [USERNAME],
    );

    if (existingUserResults.isNotEmpty) {
      showCustomSnackBar(
        "Akun dengan nama pengguna tersebut sudah ada",
        title: "Gagal Menambahkan Akun",
      );
      return false;
    }

    // Jika akun belum ada, tambahkan akun baru
    var now = DateTime.now();
    var formattedDate = DateFormat('yyyy-MM-dd').format(now);

    var insertResult = await conn.query(
      'INSERT INTO login(USERNAME, PASSWORD, since_member, role) VALUES (?, ?, ?, ?)',
      [USERNAME, PASSWORD, formattedDate, role],
    );

    var userId = insertResult.insertId;
    
    // Menyimpan informasi akun ke SharedPreferences (jika diperlukan)
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("id", userId.toString());
    prefs.setString("USERNAME", USERNAME);
    prefs.setString("since_member", formattedDate);

    // Menyimpan informasi akun ke state login (jika diperlukan)
    login.value = LOGIN(id: userId, USERNAME: USERNAME, sinceMember: formattedDate, role: role);

    showCustomSnackBar(
      "Akun berhasil ditambahkan",
      title: "Berhasil",
    );

    return true;
  } catch (e) {
    if (kDebugMode) {
      print("Error adding new user: $e");
    }
    return false;
  } finally {
    await conn?.close();
  }
}
}
