import 'dart:math';

import 'package:flutter/material.dart';

import 'method-user-volenteer.dart';

class UserDistanceProfilePage extends StatefulWidget {
  @override
  State<UserDistanceProfilePage> createState() =>
      _UserDistanceProfilePageState();
}

class _UserDistanceProfilePageState extends State<UserDistanceProfilePage> {
  List saveSylhet = [24.8945, 91.8673];
  List salutikorBazar = [24.9931, 91.8471];
  List gowainghat = [25.0936, 91.9834]; //
  List user1LatLon = [25.1634, 92.0175]; //jaflong
  List user2LatLon = [25.1691, 91.8955]; //Bisnakand, Bangladesh

  dynamic _distanc1, _distanc2, discollect1, discollect2;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("USER"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
                height: 250,
                color: Color.fromARGB(255, 176, 205, 235),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  padding: EdgeInsets.all(15),
                  children: [
                    GestureDetector(
                      child: Container(
                        color: Colors.amber,
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
                              Text("Jaflong"),
                              Divider(),
                              Text("lat: 25.1634 \nlon: 92.0175 "),
                              //  List user1LatLon = []; //
                            ]),
                      ),
                      onTap: () {
                        discollect2 =
                            DistanceUserVolenmCalculator.calculateDistance(
                                user1LatLon[0],
                                user1LatLon[1],
                                gowainghat[0],
                                gowainghat[1]);
                        discollect1 =
                            DistanceUserVolenmCalculator.calculateDistance(
                          user1LatLon[0],
                          user1LatLon[1],
                          saveSylhet[0],
                          saveSylhet[1],
                        );
                        setState(() {
                          _distanc1 = discollect1;
                          _distanc2 = discollect2;
                          print("discolle2 = ${discollect2}");
                        });
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        color: Color.fromARGB(255, 70, 184, 21),
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
                              Text("Bisnakand"),
                              Divider(),
                              Text("lat: 25.1691 \nlon: 91.8955 "),
                              // List user2LatLon = []; //, Bangladesh
                            ]),
                      ),
                      onTap: () {
                        discollect2 =
                            DistanceUserVolenmCalculator.calculateDistance(
                                user2LatLon[0],
                                user2LatLon[1],
                                gowainghat[0],
                                gowainghat[1]);
                        discollect1 =
                            DistanceUserVolenmCalculator.calculateDistance(
                          user2LatLon[0],
                          user2LatLon[1],
                          saveSylhet[0],
                          saveSylhet[1],
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
                      color: Colors.red,
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
                                Text("lat: 24.8945 & lon: 91.8673 "),
                                Text(" Team : Save Sylhet "),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.phone),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("01567987098")
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
                      color: Colors.white,
                      child: Center(),
                    ),
                    Container(
                      color: Colors.white,
                      child: Center(),
                    ),
                    GestureDetector(
                      child: Container(
                        color: Color.fromARGB(255, 212, 10, 188),
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
                              Text("lat: 24.9931, & lon: 91.8471 "),
                              //salutikorBazar = [];
                              Text(" Team : Salutikor (GSP)"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.phone),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("01567987098")
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
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("USER"),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//             child: Column(
//           children: [
//             SizedBox(
//               height: 40,
//             ),
//             Container(
//               color: Colors.amber[900],
//               height: 450,
//               width: 300,
//               child: Expanded(
//                   child: GridView.extent(
//                 primary: false,
//                 padding: const EdgeInsets.all(14),
//                 crossAxisSpacing: 15,
//                 mainAxisSpacing: 30,
//                 maxCrossAxisExtent: 150.0,
//                 children: <Widget>[
//                   GestureDetector(
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 80,
//                             width: 80,
//                             padding: const EdgeInsets.all(8),
//                           ),
//                         ],
//                       ),
//                       onTap: () {}),
//                   GestureDetector(
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 80,
//                             width: 80,
//                             padding: const EdgeInsets.all(8),
//                           ),
//                           Text(
//                             "User1",
//                             style: TextStyle(fontSize: 18),
//                           ),
//                         ],
//                       ),
//                       onTap: () {
//                         // setState(() {
//                         //   _distanc = 500;
//                         // });

//                         print("yes i am in distance =  ");
//                       }),
//                   GestureDetector(
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 80,
//                             width: 80,
//                             padding: const EdgeInsets.all(8),
//                             child: Icon(
//                               Icons.man_4,
//                               size: 60,
//                             ),
//                           ),
//                           Text("user 2")
//                         ],
//                       ),
//                       onTap: () {}),
//                   GestureDetector(
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 80,
//                             width: 80,
//                             padding: const EdgeInsets.all(8),
//                           ),
//                         ],
//                       ),
//                       onTap: () {}),
//                 ],
//               )),
//             ),
//             Divider(),
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: Column(
//                 children: [
//                   Container(
//                     color: Color.fromARGB(255, 186, 10, 177),
//                     height: 250,
//                     width: 350,
//                     child: Row(
//                       children: [
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Container(
//                           height: 150,
//                           width: 150,
//                           color: Color.fromARGB(221, 9, 128, 172),
//                           child: Column(
//                             children: [
//                               Icon(
//                                 Icons.volunteer_activism,
//                                 size: 80,
//                               ),
//                               Text(
//                                 "i am here boss",
//                                 style: TextStyle(fontSize: 18),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text("na nan ma ma",
//                                   style: TextStyle(fontSize: 18)),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           width: 30,
//                         ),
//                         Container(
//                           height: 100,
//                           width: 150,
//                           color: Color.fromARGB(221, 15, 215, 18),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Divider(
//                     color: Colors.black,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         color: Colors.lightBlue,
//                         height: 100,
//                         width: 150,
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             // ignore: unnecessary_new
//             // Expanded(
//             //     child: GridView.extent(
//             //   primary: false,
//             //   padding: const EdgeInsets.all(14),
//             //   crossAxisSpacing: 15,
//             //   mainAxisSpacing: 30,
//             //   maxCrossAxisExtent: 150.0,
//             //   children: <Widget>[
//             //     GestureDetector(
//             //         child: Column(
//             //           children: [
//             //             Container(
//             //               height: 80,
//             //               width: 80,
//             //               padding: const EdgeInsets.all(8),
//             //             ),
//             //           ],
//             //         ),
//             //         onTap: () {}),
//             //     GestureDetector(
//             //         child: Column(
//             //           children: [
//             //             Container(
//             //               height: 80,
//             //               width: 220,
//             //               padding: const EdgeInsets.all(8),
//             //             ),
//             //             Text(
//             //               "User1",
//             //               style: TextStyle(fontSize: 18),
//             //             ),
//             //             Text("ami asi ami nai"),
//             //           ],
//             //         ),
//             //         onTap: () {
//             //           setState(() {
//             //             _distanc = 500;
//             //           });

//             //           print("yes i am in distance = ${_distanc}");
//             //         }),
//             //     GestureDetector(
//             //         child: Column(
//             //           children: [
//             //             Container(
//             //               height: 80,
//             //               width: 80,
//             //               padding: const EdgeInsets.all(8),
//             //             ),
//             //           ],
//             //         ),
//             //         onTap: () {}),
//             //     GestureDetector(
//             //         child: Column(
//             //           children: [
//             //             Container(
//             //               height: 80,
//             //               width: 80,
//             //               padding: const EdgeInsets.all(8),
//             //             ),
//             //           ],
//             //         ),
//             //         onTap: () {}),
//             //     GestureDetector(
//             //         child: Column(
//             //           children: [
//             //             Container(
//             //               height: 80,
//             //               width: 80,
//             //               padding: const EdgeInsets.all(8),
//             //             ),
//             //           ],
//             //         ),
//             //         onTap: () {}),
//             //     GestureDetector(
//             //         child: Column(
//             //           children: [
//             //             Container(
//             //               height: 80,
//             //               width: 80,
//             //               padding: const EdgeInsets.all(8),
//             //             ),
//             //             Text(
//             //               "User2",
//             //               style: TextStyle(fontSize: 18),
//             //             )
//             //           ],
//             //         ),
//             //         onTap: () {}),
//             //     GestureDetector(
//             //         child: Column(
//             //           children: [
//             //             Container(
//             //               height: 80,
//             //               width: 80,
//             //               padding: const EdgeInsets.all(8),
//             //             ),
//             //             Text(
//             //               "Vol ${_distanc}",
//             //               style: TextStyle(fontSize: 18),
//             //             )
//             //           ],
//             //         ),
//             //         onTap: () {}),
//             //     GestureDetector(
//             //         child: Column(
//             //           children: [
//             //             Container(
//             //               height: 80,
//             //               width: 80,
//             //               padding: const EdgeInsets.all(8),
//             //             ),
//             //           ],
//             //         ),
//             //         onTap: () {}),
//             //     GestureDetector(
//             //         child: Column(
//             //           children: [
//             //             Container(
//             //               height: 80,
//             //               width: 80,
//             //               padding: const EdgeInsets.all(8),
//             //             ),
//             //           ],
//             //         ),
//             //         onTap: () {}),
//             //     GestureDetector(
//             //         child: Column(
//             //           children: [
//             //             Container(
//             //               height: 80,
//             //               width: 80,
//             //               padding: const EdgeInsets.all(8),
//             //             ),
//             //           ],
//             //         ),
//             //         onTap: () {}),
//             //     GestureDetector(
//             //         child: Column(
//             //           children: [
//             //             Container(
//             //               height: 80,
//             //               width: 80,
//             //               padding: const EdgeInsets.all(8),
//             //             ),
//             //             Text(
//             //               "Volunteer2",
//             //               style: TextStyle(fontSize: 18),
//             //             )
//             //           ],
//             //         ),
//             //         onTap: () {}),
//             //     GestureDetector(
//             //         child: Column(
//             //           children: [
//             //             Container(
//             //               height: 80,
//             //               width: 80,
//             //               padding: const EdgeInsets.all(8),
//             //             ),
//             //             Text(
//             //               "Volunteer3",
//             //               style: TextStyle(fontSize: 18),
//             //             )
//             //           ],
//             //         ),
//             //         onTap: () {}),
//             //   ],
//             // )),

//             SizedBox(
//               height: 20,
//             )
//           ],
//         )),
//       ),
//       backgroundColor: Color.fromARGB(248, 245, 245, 245),
//     );
//   }
// }

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
