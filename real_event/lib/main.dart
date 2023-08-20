import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_event/services/notification_service.dart';
import 'package:real_event/views/home/home_screen.dart';
import 'package:real_event/views/onboarding_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

Future<Null> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.toString());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  LocalNotificationService.initialize();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context)
              .textTheme, // If this is not set, then ThemeData.light().textTheme is used.
        ),
      ),
      title: 'YoEvent App',
      home: OnBoardingScreen(),
      // home: Scaffold(
      //   body: FirebaseAuth.instance.currentUser == null
      //       ? OnBoardingScreen()
      //       : HomeScreen(),
      // ),
    );
  }
}
