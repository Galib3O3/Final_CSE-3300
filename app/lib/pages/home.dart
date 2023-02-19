import 'package:app/user_distance/app/views/District-information/LocationAndVolunterrs/SylhetRegion.dart';
import 'package:app/app/profile-pages/six_profile_page.dart';
import 'package:app/function/user_func.dart';
import 'package:app/pages/homepage.dart';
import 'package:app/login_reg/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  User? user = FirebaseAuth.instance.currentUser;
  UserFunc loggedUser = UserFunc();

  @override
  void initState() {
    // TODO: implement initState
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
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 180,
                child: Image.asset("img/sv.png"),
              ),
              const Text(
                "Welcome man",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text("${loggedUser.firstName} ${loggedUser.lastName}",
                  style: const TextStyle(
                      color: Colors.blueAccent, fontWeight: FontWeight.bold)),
              Text("${loggedUser.email}",
                  style: const TextStyle(
                      color: Colors.blueAccent, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),
              // Text("${loggedUser.role}",
              //     style: const TextStyle(
              //         color: Colors.blueAccent, fontWeight: FontWeight.bold)),
              // const SizedBox(
              //   height: 10,
              // ),

              ActionChip(
                  label: const Text("Logout"),
                  onPressed: () {
                    logout(context);
                  }),
              ElevatedButton(
                  onPressed: () {
                    Get.to((SixProfileView()));
                  },
                  child: Text("HomePage")),
            ],
          ),
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
