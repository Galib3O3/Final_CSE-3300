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
        title: const Text("Profile"),
      ),
      backgroundColor: const Color.fromARGB(197, 132, 206, 234),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 120,
            ),
            Container(
              //color: Colors.red,
              height: 200,
              child: Image.asset(
                "img/pp.png",
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 350,
              height: 40,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 161, 218, 226),
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.black)),
              child: ListView(scrollDirection: Axis.horizontal, children: [
                Row(
                  children: [
                    const Text(
                      "Name :   ",
                      style: TextStyle(
                        fontSize: 20,
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
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 161, 218, 226),
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.black)),
              width: 350,
              height: 40,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      " Email :   ",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text("${loggedUser.email}",
                        style: const TextStyle(
                          fontSize: 20,
                        )),
                  ],
                ),
              ]),
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 161, 218, 226),
                  borderRadius: BorderRadius.circular(110.0),
                  border: Border.all(color: Colors.black)),
              width: 190,
              height: 50,
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
                                color: Color.fromARGB(255, 117, 1, 134),
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
            const SizedBox(
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

  // Widget ColumnT() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       SingleChildScrollView(
  //         child: Container(
  //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  //           child: Column(
  //             children: [
  //               SizedBox(
  //                 height: 130,
  //               ),
  //               const Icon(
  //                 Icons.account_circle,
  //                 size: 100,
  //                 color: Colors.black,
  //               ),
  //               const SizedBox(
  //                 height: 40,
  //               ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   const Text(
  //                     "Name  :",
  //                     style: TextStyle(
  //                       fontSize: 16,
  //                     ),
  //                   ),
  //                   Text("${loggedUser.firstName} ${loggedUser.lastName}",
  //                       style: const TextStyle(
  //                         fontSize: 20,
  //                       )),
  //                 ],
  //               ),
  //               const Divider(
  //                 height: 20,
  //               ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   const Text(
  //                     "Email  :",
  //                     style: TextStyle(fontSize: 16),
  //                   ),
  //                   Text("${loggedUser.email}",
  //                       style: const TextStyle(
  //                         fontSize: 20,
  //                       )),
  //                 ],
  //               ),
  //               const SizedBox(
  //                 height: 150,
  //               ),
  //               Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   user!.emailVerified
  //                       ? Container(
  //                           height: 40,
  //                           width: 100,
  //                           color: Color.fromARGB(255, 26, 226, 59),
  //                           child: const Text(
  //                             "Verified",
  //                             style: TextStyle(
  //                                 color: Color.fromARGB(255, 200, 10, 229),
  //                                 fontSize: 24),
  //                             textAlign: TextAlign.center,
  //                           ),
  //                         )
  //                       : TextButton(
  //                           onPressed: () {
  //                             verifymail();
  //                           },
  //                           child: const Text(
  //                             "Verify mail",
  //                             style: TextStyle(
  //                                 color: Color.fromARGB(255, 181, 13, 13)),
  //                           ),
  //                         ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
