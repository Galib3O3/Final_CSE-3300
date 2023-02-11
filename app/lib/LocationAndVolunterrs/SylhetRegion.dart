import 'package:app/Sunamgonj_info/sunamgonj_info.dart';
import 'package:flutter/material.dart';
import 'package:app/function/user_func.dart';
import 'package:app/pages/homepage.dart';
import 'package:app/login_reg/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Sylhet_information/syl_info.dart';

class get_d extends StatefulWidget {
  const get_d({super.key});

  @override
  State<get_d> createState() => _get_dState();
}

class _get_dState extends State<get_d> {
  final CollectionReference firebase =
      FirebaseFirestore.instance.collection("sylhet");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Areas")),
        body: StreamBuilder(
          stream: firebase.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(color: Colors.red),
              );
            }
            return ListView(
              children: snapshot.data!.docs.map((document) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Info(document)));
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.0,
                            width: 10.0,
                          ),
                          Card(
                            child: ListTile(
                              title: Text(
                                document["name"],
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                ),
                              ),
                              subtitle: Text("upozilla's"),
                              leading: Icon(Icons.location_pin,
                                  size: 40, color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Info1(document)));
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10.0,
                                width: 10.0,
                              ),
                              Card(
                                child: ListTile(
                                  title: Text(
                                    document["NAME"],
                                    style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.black,
                                    ),
                                  ),
                                  subtitle: Text("upozilla's"),
                                  leading: Icon(Icons.location_pin,
                                      size: 40, color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                );
              }).toList(),
            );
          },
        ));
  }
}
