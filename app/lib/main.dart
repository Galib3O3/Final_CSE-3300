import 'package:app/forgate_password/forgatePassword.dart';
import 'package:app/login_reg/registration.dart';
import 'package:app/pages/splash.dart';
import 'package:app/user_distance/user.dart';
import 'package:app/user_distance/user_distance.dart';
import 'package:app/user_distance/user_distance_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp();
  //print(FirebaseAuth.instance.currentUser!);
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
        home:UserPage());
  }
}
 //hello man