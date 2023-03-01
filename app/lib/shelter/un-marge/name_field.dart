import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_design/user-form/hs_sylhet_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_screen.dart';

int indexPick = 1;

class namefield extends StatefulWidget {
  const namefield({super.key});

  @override
  State<namefield> createState() => _namefieldState();
}

class _namefieldState extends State<namefield> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Card(
          // ignore: prefer_const_constructors
          child: TextField(
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                // ignore: prefer_const_constructors
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
              ),
              onChanged: (val) {
                setState(() {
                  name = val;
                });
              }),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("user").snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              // ignore: prefer_const_constructors
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data!.docs[index].data()
                        as Map<String, dynamic>;

                    if (name.isEmpty) {
                      return ListTile(
                          onTap: () {
                            setState(() {
                              indexPick = index;
                            });

                            DynamicPageChangeHelper(indexPick, context);
                          },
                          title: Text(
                            data['name'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            data['noShelter'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          leading: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 120, 138, 241),
                            radius: 15,
                          ));
                    }
                    if (data['name']
                        .toString()
                        .toLowerCase()
                        .startsWith(name.toLowerCase())) {
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  GowainghatSchoolNameListShow(),
                            ),
                          );
                        },
                        title: Text(
                          data['name'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          data['noShelter'],
                          maxLines: 1,
                        ),
                      );
                    }
                    return Container();
                  },
                );
        },
      ),
    );
  }
}

Widget DynamicPageChangeHelper(var index, BuildContext context) {
  if (index == 0) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GowainghatSchoolNameListShow(),
      ),
    );
  } else if (index == 2) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SylhetSchoolNameListShow(),
      ),
    );
  } else if (index == 1) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Data is pending'),
          content: Text('Update soon.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
  return Scaffold(
      body: Container(
    height: 122,
    width: 123,
    color: Colors.red,
  ));
}
