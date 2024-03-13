import 'package:firebase_messaging/firebase_messaging.dart';

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
      // Tampilkan notifikasi kepada pengguna atau lakukan logika lainnya
    });
  }
}
