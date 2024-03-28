import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:lji/Register.dart';
import 'package:lji/SignIn.dart';
import 'package:lji/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase/firebase_notification.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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

  // Initialize AwesomeNotifications
  AwesomeNotifications().initialize(
    'resource://drawable/logoes', // Replace with your app icon name
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic notifications',
        defaultColor: Color(0xFF9D50DD),
        ledColor: Colors.white,
      ),
    ],
  );

  // Request permission for Firebase messaging
  final FirebaseMessaging messaging = FirebaseMessaging.instance;
  final settings = await messaging.requestPermission(
    alert: true,
    announcement: true,
    badge: true,
    carPlay: true,
    criticalAlert: true,
    provisional: true,
    sound: true,
  );

  // Get the registration token
  String? token = await messaging.getToken();

  if (kDebugMode) {
    print('Registration Token: $token');
    print('Permission granted: ${settings.authorizationStatus}');
  }

  // Create a navigator key
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Configure Firebase notifications
  FirebaseNotification firebaseNotification = FirebaseNotification();

  // Initialize and configure Firebase notifications
  await firebaseNotification.configure(navigatorKey.currentContext!);

  // Run the app
  runApp(MyApp(navigatorKey: navigatorKey));
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const MyApp({Key? key, required this.navigatorKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      initialRoute: '/', // Initial route of the app
      navigatorKey: navigatorKey, // Set the navigator key
      routes: {
        '/': (context) => SplashScreen(), // Route for the main splash screen
        '/login': (context) => SignScreen(), // Route for the login screen
        '/register': (context) => Register(), // Route for the registration screen
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
