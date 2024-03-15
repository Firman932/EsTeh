import 'package:flutter/material.dart';
import 'package:lji/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase/firebase_notification.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Inisialisasi FirebaseNotification setelah Firebase selesai diinisialisasi
  FirebaseNotification firebaseNotification = FirebaseNotification();
  await firebaseNotification.configure();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
