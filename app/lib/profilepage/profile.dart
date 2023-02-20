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
      backgroundColor: Color.fromARGB(198, 178, 197, 204),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 120,
            ),
            Container(
              //color: Colors.red,
              height: 150,
              child: const Icon(
                Icons.account_circle,
                size: 150,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 350,
              height: 80,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 12, 186, 209),
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.black)),
              child: ListView(scrollDirection: Axis.horizontal, children: [
                Row(
                  children: [
                    const Text(
                      "Name adfaffdsaaasdfafafffffffffffffffffffffaaaaaaaaaafa  :",
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
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 350,
              height: 80,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 209, 12, 12),
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.black)),
              child: Row(
                  //scrollDirection: Axis.horizontal,
                  children: [
                    Text(
                      "Email : ",
                      style: TextStyle(fontSize: 20),
                    ),
                    Container(
                      height: 20,
                      width: 250,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Text(
                            "      samisamdfasffffffffffffffffamas",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    )
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 12, 186, 209),
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.black)),
              width: 350,
              height: 80,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 12, 186, 209),
                  borderRadius: BorderRadius.circular(120.0),
                  border: Border.all(color: Colors.black)),
              width: 180,
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  user!.emailVerified
                      ? Container(
                          height: 40,
                          width: 100,
                          // color: Color.fromARGB(255, 26, 226, 59),
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
            ),
            SizedBox(
              height: 150,
            ),
          ],
        ),
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

  Widget ColumnT() {
    return Column(
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
    );
  }
}
