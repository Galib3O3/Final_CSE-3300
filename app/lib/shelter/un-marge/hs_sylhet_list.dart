import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SylhetSchoolNameListShow extends StatefulWidget {
  const SylhetSchoolNameListShow({Key? key}) : super(key: key);

  @override
  _SylhetSchoolNameListShowState createState() =>
      _SylhetSchoolNameListShowState();
}

class _SylhetSchoolNameListShowState extends State<SylhetSchoolNameListShow> {
  var st = Get.arguments;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late List<String> dataArray;

  @override
  void initState() {
    super.initState();
    dataArray = [""];
    fetchData();
  }

  Future<void> fetchData() async {
    final CollectionReference collection = firestore.collection('sadar');
    final QuerySnapshot querySnapshot = await collection.get();
    final List<DocumentSnapshot> documents = querySnapshot.docs;

    List<String> dataArray = [" "];

    documents.forEach((document) {
      final dynamic data = document.data();
      if (data.containsKey('noSchool')) {
        final List<dynamic> arrayData = data['noSchool'];
        arrayData.forEach((item) {
          dataArray.add(item.toString());
        });
      }
    });

    setState(() {
      this.dataArray = dataArray;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> info = [];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shelter'),
      ),
      body: dataArray == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: dataArray.length,
              itemBuilder: (context, index) {
                final item = dataArray[index];
                return ListTile(
                  title: Text(item),
                  // leading: CircleAvatar(
                  //   backgroundColor: Color.fromARGB(255, 79, 106, 255),
                  //   radius: 30,
                  // ),
                  onTap: () {
                    print("");
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "$item",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  Text(
                                    "People 150",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  Text(
                                    "$index",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        color: Colors.red,
                                      ),
                                      Container(
                                        width: 20,
                                        height: 20,
                                        color:
                                            Color.fromARGB(255, 54, 244, 127),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16.0),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
    );
  }
}
