import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:lji/snackbarlogin.dart';
import 'package:mysql1/mysql1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class LOGIN {
  final int? id;
  final String USERNAME;
  final String? sinceMember;

  LOGIN({this.id, required this.USERNAME, this.sinceMember});
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

  //register

  Future<bool> registerUser(String USERNAME, String PASSWORD) async {
    MySqlConnection? conn;
    try {
      conn = await connectToDatabase();

      var emailCheckResults = await conn
          .query('SELECT * FROM login WHERE USERNAME = ?', [USERNAME]);

      if (emailCheckResults.isNotEmpty) {
        showCustomSnackBar("ERROR", title: "Ada yang salah bang");
        return false;
      }

      var now = DateTime.now();
      var formattedDate = DateFormat('yyyy-MM-dd').format(now);

      var insertResult = await conn.query(
          'INSERT INTO login(USERNAME,PASSWORD, since_member) VALUES (?, ?, ?)',
          [USERNAME, PASSWORD, formattedDate]);

      var userId = insertResult.insertId;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("id", userId.toString());
      prefs.setString("USERNAME", USERNAME);

      login.value =
          LOGIN(id: userId, USERNAME: USERNAME, sinceMember: formattedDate);
      return true;
    } catch (e) {
      if (kDebugMode) {
        print("Error inserting user data $e");
      }
      return false;
    } finally {
      await conn?.close();
    }
  }

//login

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
          "Incorrect email or password",
          title: "Login",
        );
        return false;
      }
      var login = result.first;
      var userid = login['id'];

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('id', userid.toString());
      prefs.setString('USERNAME', login['USERNAME']);
      String sinceMemberString = login['since_member']?.toString() ?? '';
      prefs.setString('since_member', sinceMemberString);

      userid.values = LOGIN(
        id: userid,
        USERNAME: userid['USERNAME'],
        sinceMember: sinceMemberString,
      );
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
}
