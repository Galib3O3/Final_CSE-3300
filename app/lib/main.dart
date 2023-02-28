import 'package:app/app/profile-pages/six_profile_page.dart';
import 'package:app/pages/splash.dart';
import 'package:app/profilepage/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Dontaion/donation.dart';
import 'about_us/about_us.dart';

Future<void> main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of my application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Save Community',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
<<<<<<< HEAD
       
        home: SixProfileView());
=======
        // home: AboutusPage());
        home: SplashScreen());
>>>>>>> 065bb8b6fe6cc8d6a1856c825ec65d35a817801a
  }
}
