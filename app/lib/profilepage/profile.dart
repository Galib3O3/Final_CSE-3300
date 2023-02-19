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
      backgroundColor: Color.fromARGB(199, 68, 202, 255),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 130,
                  ),
                  const Icon(
                    Icons.account_circle,
                    size: 100,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Name  :",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text("${loggedUser.firstName} ${loggedUser.lastName}",
                          style: const TextStyle(
                            fontSize: 20,
                          )),
                    ],
                  ),
                  const Divider(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Email  :",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text("${loggedUser.email}",
                          style: const TextStyle(
                            fontSize: 20,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      user!.emailVerified
                          ? Container(
                              height: 40,
                              width: 100,
                              color: Color.fromARGB(255, 26, 226, 59),
                              child: const Text(
                                "Verified",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 200, 10, 229),
                                    fontSize: 24),
                                textAlign: TextAlign.center,
                              ),
                            )
                          : TextButton(
                              onPressed: () {
                                verifymail();
                              },
                              child: const Text(
                                "Verify mail",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 181, 13, 13)),
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
