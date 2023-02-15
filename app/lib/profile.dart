import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'function/user_func.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Name",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Divider(
              height: 10,
            ),
            SizedBox(height: 8.0),
            Text("${loggedUser.firstName} ${loggedUser.lastName}",
                style: const TextStyle(
                    color: Colors.blueAccent, fontWeight: FontWeight.bold)),
            SizedBox(height: 20.0),
            Text(
              "Email",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Divider(
              height: 10,
            ),
            SizedBox(height: 8.0),
            Text("${loggedUser.email} ",
                style: const TextStyle(
                    color: Colors.blueAccent, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
