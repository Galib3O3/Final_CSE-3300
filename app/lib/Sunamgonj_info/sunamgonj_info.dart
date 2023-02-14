import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../user_distance/SunamganjDistancePage/dirai-sunamganj-volunteer.dart';
import '../user_distance/SunamganjDistancePage/tahirpur-sunamganj-volunter.dart';
import '../user_distance/SunamganjDistancePage/userDistanceProfileSunamganj.dart';
import '../user_distance/UserDistanceSylSadar/user_distance_page.dart';

class Info1 extends StatelessWidget {
  final data;
  Info1(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Areas")),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Column(
            children: [
              SizedBox(height: 5.0),
              Column(
                children: [
                  SizedBox(height: 15.0),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Card(
                      color: Color.fromARGB(255, 214, 208, 190),
                      child: ListTile(
                        title: Text(
                          data["sunamgonj"],
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UserDistanceProfilePage_sunamganj()));
                        },
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 9, 129, 241),
                          child: Icon(
                            Icons.location_pin,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 5.0),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Card(
                      child: ListTile(
                        title: Text(
                          data["dirai"],
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UserDistanceProfilePage_dirai()));
                        },
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 9, 129, 241),
                          child: Icon(
                            Icons.location_pin,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                //mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: 5.0),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Card(
                      child: ListTile(
                        title: Text(
                          data["tahirpur"],
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UserDistanceProfilePage_tahirpur()));
                        },
                        //
                        // leading: Icon(Icons.location_pin,
                        //     size: 40, color: Colors.blue),

                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 9, 129, 241),
                          child: Icon(
                            Icons.location_pin,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
