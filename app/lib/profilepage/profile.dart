import 'package:app/app/profile-pages/six_profile_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../function/user_func.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserFunc loggedUser = UserFunc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const SixProfileView()));
        }),
        title: Text("Profile"),
      ),
      backgroundColor: Colors.blueAccent,
      body: Column(
        children: [
          Container(
            // decoration: const BoxDecoration(
            //     gradient: LinearGradient(
            //         begin: Alignment.topLeft,
            //         end: Alignment.bottomRight,
            //         colors: [
            //       Color.fromARGB(255, 74, 69, 234),
            //       Color.fromARGB(255, 139, 65, 217)
            //     ])),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 200),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Icon(
                    Icons.account_circle,
                    size: 100,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Name - ",
                        style: TextStyle(fontSize: 15),
                      ),
                      Text("${loggedUser.firstName} ${loggedUser.lastName}",
                          style: const TextStyle(
                            fontSize: 20,
                          )),
                    ],
                  ),
                  const Divider(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Email -",
                        style: TextStyle(fontSize: 15),
                      ),
                      Text("${loggedUser.email}",
                          style: const TextStyle(
                            fontSize: 20,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 62,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      user!.emailVerified
                          ? const Text("Verified")
                          : TextButton(
                              onPressed: () {
                                verifymail();
                              },
                              child: const Text(
                                "Verify mail",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

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

  verifymail() async {
    if (user != null && !user!.emailVerified) {
      await user!.sendEmailVerification();
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text("Verification Mail has been sent",
              style: TextStyle(fontSize: 18.0)),
        ),
      );
    }
  }
}
