import 'dart:async';
import 'package:app/app/profile-pages/six_profile_page.dart';
import 'package:app/welcomeScreen/welcomeScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class splashS extends StatefulWidget {
  const splashS({super.key});

  @override
  State<splashS> createState() => _splashSState();
}

class _splashSState extends State<splashS> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (splashSState) => StreamBuilder<User?>(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return StreamBuilder<
                            DocumentSnapshot<Map<String, dynamic>>>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(snapshot.data!.uid)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return const SixProfileView();
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        );
                      } else {
                        return const welcomeS();
                      }
                    },
                  )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "img/sv.png",
              width: 250,
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}

