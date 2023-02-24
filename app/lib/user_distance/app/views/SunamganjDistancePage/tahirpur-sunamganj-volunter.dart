import 'dart:math';

import 'package:flutter/material.dart';

import '../../model/user-volenteer-method-.dart';

class UserDistanceProfilePage_tahirpur extends StatefulWidget {
  @override
  State<UserDistanceProfilePage_tahirpur> createState() =>
      _UserDistanceProfilePage_tahirpurState();
}

class _UserDistanceProfilePage_tahirpurState
    extends State<UserDistanceProfilePage_tahirpur> {
  List saveSunamganj = [25.0668, 91.4073];
  List tahirpurSP = [25.0994, 91.1787];
  List user1LatLon = [25.0982, 91.1796]; // Tahirpur GSC
  List user2LatLon = [25.0982, 91.1796]; // Tahirpur GSC,
  dynamic _distanc1, _distanc2, discollect1, discollect2;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("user distance"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
                height: 250,
                // color: Color.fromARGB(255, 176, 205, 235),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  padding: EdgeInsets.all(15),
                  children: [
                    GestureDetector(
                      child: Container(
                        //color: Colors.amber,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                            ]),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        //color: Color.fromARGB(255, 70, 184, 21),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Icon(
                                Icons.man_2_sharp,
                                size: 64,
                              ),
                              Text("Tahirpur Students P"),
                              Divider(),
                              Text("lat lon 25.0994, 91.1787"),
                              //List tahirpurSP = [];
                            ]),
                      ),
                      onTap: () {
                        discollect2 =
                            DistanceUserVolenmCalculator.calculateDistance(
                                user2LatLon[0],
                                user2LatLon[1],
                                tahirpurSP[0],
                                tahirpurSP[1]);
                        discollect1 =
                            DistanceUserVolenmCalculator.calculateDistance(
                          user2LatLon[0],
                          user2LatLon[1],
                          saveSunamganj[0],
                          saveSunamganj[1],
                        );
                        setState(() {
                          _distanc1 = discollect1;
                          _distanc2 = discollect2;
                          // print("discolle2 = ${discollect2}");
                        });
                      },
                    ),
                  ],
                )),
            Container(
              height: 800,
              child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 10,
                  padding: EdgeInsets.all(10),
                  children: [
                    Container(
                      //color: Colors.red,
                      child: Center(
                        child: InkWell(
                            onTap: () {
                              // Add your onTap logic here
                              //  print('Container was tapped');
                            },
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Icon(
                                  Icons.volunteer_activism,
                                  size: 60,
                                ),
                                SizedBox(
                                  height: 20,
                                ),

                                Text("lat lon 25.0668 , 91.4073"),
                                Text(" Team : Save Sunamganj "),
                                // List user2LatLon = [25.0990, 91.1755]; // Tahirpur,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.phone),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("01722635678")
                                  ],
                                ),
                                Divider(),
                                Text(
                                  "Total Dis : ${_distanc1} miles",
                                  style: TextStyle(fontSize: 14),
                                ),
                                // Text(" sdfjtrfj teioert  jasdjfj "),
                              ],
                            )),
                      ),
                    ),
                    Container(
                      // color: Colors.white,
                      child: Center(),
                    ),
                    Container(
                      //color: Colors.white,
                      child: Center(),
                    ),
                    GestureDetector(
                      child: Container(
                        // color: Color.fromARGB(255, 212, 10, 188),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Icon(
                                Icons.volunteer_activism,
                                size: 60,
                              ),
                              SizedBox(
                                height: 20,
                              ),

                              Text("lat lon 25.0982, 91.1796 "),
                              //salutikorBazar = [];
                              Text(" Team : Tahirpur Students P"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.phone),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("01734343434")
                                ],
                              ),
                              Divider(),
                              Text(
                                "Total Dis : ${_distanc2} miles",
                                style: TextStyle(fontSize: 14),
                              ),
                              // Text(" sdfjtrfj teioert  jasdjfj "),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        print('Containner blue is tapped ');
                      },
                    ),
                  ]),
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(248, 245, 245, 245),
    );
  }
}

Widget bongsong() {
  return Expanded(
      child: GridView.extent(
    primary: false,
    padding: const EdgeInsets.all(14),
    crossAxisSpacing: 15,
    mainAxisSpacing: 30,
    maxCrossAxisExtent: 150.0,
    children: <Widget>[
      GestureDetector(
          child: Column(
            children: [
              Container(
                height: 80,
                width: 80,
                padding: const EdgeInsets.all(8),
              ),
            ],
          ),
          onTap: () {}),
      GestureDetector(
          child: Column(
            children: [
              Container(
                height: 80,
                width: 80,
                padding: const EdgeInsets.all(8),
              ),
              Text(
                "User1",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          onTap: () {
            // setState(() {
            //   _distanc = 500;
            // });

            print("yes i am in distance =  ");
          }),
      GestureDetector(
          child: Column(
            children: [
              Container(
                height: 80,
                width: 80,
                padding: const EdgeInsets.all(8),
              ),
            ],
          ),
          onTap: () {}),
      GestureDetector(
          child: Column(
            children: [
              Container(
                height: 80,
                width: 80,
                padding: const EdgeInsets.all(8),
              ),
              Text("user 2")
            ],
          ),
          onTap: () {}),
    ],
  ));
}
