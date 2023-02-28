import 'package:app/pages/splash.dart';
import 'package:app/profilepage/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Dontaion/donation.dart';
<<<<<<< HEAD
import 'optional/SylhetRegion.dart';
=======
import 'about_us/about_us.dart';
>>>>>>> a9f6392816b27cf493f706ca404a6e857d7decff

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
        home:  SplashScreen());
  }
}
