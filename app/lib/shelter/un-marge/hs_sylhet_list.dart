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

  List<String> IngridentList = [
    " ",
    "Population = 300 \n Chira = 10kg \n Muri = 4kg \n Gur = 3kg",
    "Population = 200 \n Chira = 7kg \n Muri = 3kg \n Gur = 3kg",
    "Population = 360 \n Chira = 110kg \n Muri = 5kg \n Gur = 2kg",
    "Population = 480 \n Chira = 12kg \n Muri = 5kg \n Gur = 4kg"
  ];

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
                if (index == 0) {
                  return ListTile(
                    title: Container(
                        color: Color.fromARGB(255, 76, 218, 213),
                        height: 40,
                        child: Center(
                            child: Text(" C L I C K & KNOW THE UPDATE "))),
                  );
                }

                if (item == null || item.isEmpty) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 45, 222, 189),
                      radius: 20,
                      child: Column(
                        //alternative stack
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.pending,
                              color: Color.fromARGB(255, 242, 243, 244)),
                        ],
                      ),
                    ),
                    title: Text("Under constructions"),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          /// you should  design
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: SingleChildScrollView(
                              child: Container(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  // mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Data is pending ",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    // ignore: prefer_const_constructors
                                    Text(
                                      "Update soon ",
                                      // ignore: prefer_const_constructors
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      ),
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
                }
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 20,
                    child: Column(
                      // alignment: Alignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.night_shelter, color: Colors.white),
                      ],
                    ),
                  ),
                  title: Text(item),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 55, 160, 245),
                                  Colors.green,
                                  Color.fromARGB(255, 222, 40, 182),
                                  Color.fromARGB(255, 237, 230, 18),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text(
                                    "$item",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 16.0),
                                  Text(
                                    "${IngridentList[index]}",
                                    // ignore: prefer_const_constructors
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ),
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
