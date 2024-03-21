import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:lji/Register.dart';
import 'package:lji/SignIn.dart';
import 'package:lji/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase/firebase_notification.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize FlutterLocalNotificationsPlugin
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Android initialization
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('logoes');

  // Initialize settings for Android
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  // Initialize the plugin with the appropriate settings
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Inisialisasi FirebaseNotification setelah Firebase selesai diinisialisasi
  FirebaseNotification firebaseNotification = FirebaseNotification();
  await firebaseNotification.configure();

  runApp(MyApp());
  // Panggil fungsi untuk mengatur tampilan loading
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      initialRoute: '/', // Rute awal ketika aplikasi dimulai
      routes: {
        '/': (context) => SplashScreen(), // Rute untuk halaman utama aplikasi
        '/login': (context) => SignScreen(), // Rute untuk halaman login
        '/register': (context) => Register(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
