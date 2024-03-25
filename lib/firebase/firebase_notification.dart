import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseNotification {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> configure() async {
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
    });
  }

  // Fungsi untuk menampilkan notifikasi
  Future<void> _showNotification(RemoteMessage message) async {
    // Inisialisasi flutter_local_notifications
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('resource://drawable/logoes');
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
}
