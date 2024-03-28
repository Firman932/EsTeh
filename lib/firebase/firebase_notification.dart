import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:lji/Admin/Notifikasi/notifikasi.dart';
import 'package:lji/FOR%20USER/HistoryUser/HistoryUser.dart';

class FirebaseNotification {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> configure(BuildContext context) async {
    // Inisialisasi Firebase Messaging
    await _firebaseMessaging.requestPermission();

    // Mendapatkan FCM Token
    String? token = await _firebaseMessaging.getToken();
    print("FCM Token: $token");

    // Mendengarkan pesan (notifikasi)
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Menerima pesan: ${message.notification?.title}");
      // Tampilkan notifikasi menggunakan flutter_local_notifications
      _showNotification(message);
      redirectToPageBasedOnRole(context, token);
    });
  }

  // Fungsi untuk menampilkan notifikasi
  Future<void> _showNotification(RemoteMessage message) async {
    // Inisialisasi flutter_local_notifications
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('logoes');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // Ekstrak judul dan pesan notifikasi dari pesan
    String? title = message.notification?.title;
    String? body = message.notification?.body;

    // Konfigurasi detail notifikasi
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your channel id', // ID kanal notifikasi
      'your channel name', // Nama kanal notifikasi
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      // Deskripsi kanal notifikasi diberikan sebagai named argument
      channelDescription: 'your channel description',
    );

    NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    // Tampilkan notifikasi
    await flutterLocalNotificationsPlugin.show(
      0, // ID notifikasi
      title, // Judul notifikasi
      body, // Isi notifikasi
      platformChannelSpecifics, // Detail notifikasi
    );
  }

  // Fungsi untuk mengarahkan pengguna ke halaman yang sesuai berdasarkan peran
  Future<void> redirectToPageBasedOnRole(
      BuildContext context, String? fcmToken) async {
    try {
      if (fcmToken != null) {
        // Dapatkan data pengguna dari database berdasarkan FCM token
        DocumentSnapshot? userSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('fcmToken', isEqualTo: fcmToken)
            .get()
            .then((snapshot) {
          // Ambil dokumen pertama (harusnya hanya ada satu hasil)
          if (snapshot.docs.isNotEmpty) {
            return snapshot.docs.first;
          } else {
            return null;
          }
        });

        if (userSnapshot != null && userSnapshot.exists) {
          // Dapatkan role dan user ID dari dokumen pengguna
          String role = userSnapshot['role'];
          String userId = userSnapshot['user_id'];

          // Redirect ke halaman berdasarkan role
          if (role == 'admin') {
            // Redirect ke halaman Notifikasi untuk admin
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Notifikasi()),
            );
          } else {
            // Redirect ke halaman Riwayat untuk pengguna
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RiwayatUser(userId: userId)),
            );
          }
        } else {
          print('User tidak ditemukan');
          // Handle case di mana user tidak ditemukan
        }
      } else {
        print('FCM token tidak valid');
        // Handle case jika FCM token tidak valid
      }
    } catch (e) {
      print('Error: $e');
      // Handle error jika terjadi kesalahan saat mengambil data pengguna dari database
    }
  }
}
