import 'dart:ui';
import 'package:app/Dontaion/donation1.dart';
import 'package:app/LocationAndVolunterrs/SylhetRegion.dart';
import 'package:app/about_us/about_us.dart';
import 'package:app/app/profile-pages/liveChatADH/livechat.dart';
import 'package:app/profilepage/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../Dontaion/donation.dart';
import '../../function/user_func.dart';
import '../../login_reg/login.dart';
import '../../weather-parts/main-page/district-profile.dart';

class SixProfileView extends StatefulWidget {
  const SixProfileView({super.key});

  @override
  _SixProfileViewState createState() => _SixProfileViewState();
}

class _SixProfileViewState extends State<SixProfileView> {
  dynamic lat, lon, sunRise, sunSet, wind;

  User? user = FirebaseAuth.instance.currentUser;
  UserFunc loggedUser = UserFunc();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedUser = UserFunc.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              icon: Icon(Icons.exit_to_app))
        ],
        title: const Center(child: Text("HOME PAGE")),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),

          // ignore: unnecessary_new
          Expanded(
              child: GridView.extent(
            primary: false,
            padding: const EdgeInsets.all(14),
            crossAxisSpacing: 15,
            mainAxisSpacing: 40,
            maxCrossAxisExtent: 200.0,
            children: <Widget>[
              GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/clouds_sun.png"),
                            fit: BoxFit.cover,
                            repeat: ImageRepeat.noRepeat,
                          ),
                        ),
                      ),
                      const Text(
                        "weather",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  onTap: () {
                    Get.to(DistrictGridPage());
                  }),
              GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/shelter.png"),
                            fit: BoxFit.cover,
                            repeat: ImageRepeat.noRepeat,
                          ),
                        ),
                      ),
                      const Text(
                        "Shelter",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      // Get.to(MyHomePage(title: 'Flutter Demo Home Page'));
                    });
                  }),
              GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/volunteer.png"),
                            fit: BoxFit.cover,
                            repeat: ImageRepeat.noRepeat,
                          ),
                        ),
                      ),
                      const Text(
                        "Volunteer",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      Get.to(get_d());
                    });
                  }),
              GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/donation.png"),
                            fit: BoxFit.cover,
                            repeat: ImageRepeat.noRepeat,
                          ),
                        ),
                      ),
                      Text(
                        "Donation",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      Get.to(donation());
                    });
                  }),
              GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/LC.png"),
                            fit: BoxFit.cover,
                            repeat: ImageRepeat.noRepeat,
                          ),
                        ),
                      ),
                      Text(
                        "Live Chat",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      Get.to(livecaht());
                      //Get.to(MyHomePage(title: 'Flutter Demo Home Page'));
                    });
                  }),
              GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/about_us.png"),
                            fit: BoxFit.cover,
                            repeat: ImageRepeat.noRepeat,
                          ),
                        ),
                      ),
                      Text(
                        "about us",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      Get.to(RowCol_11());
                    });
                  }),
            ],
          )),
          ElevatedButton(
              onPressed: () {
                logout(context);
              },
              child: Text("Log out")),
          SizedBox(
            height: 20,
          ),
        ],
      )),
      backgroundColor: Color.fromARGB(248, 245, 245, 245),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName:
                  Text("${loggedUser.firstName} ${loggedUser.lastName}",
                      style: const TextStyle(
                        fontSize: 20,
                      )),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1620641788421-7a1c342ea42e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80'),
                  fit: BoxFit.cover,
                ),
              ),
              accountEmail: Text("${loggedUser.email}",
                  style: const TextStyle(
                    fontSize: 20,
                  )),
            ),
            ListTile(
              title: const Text('Profile '),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const loginscreen()));
  }
}
