import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../views/copy-main.dart';

class DistrictGridPage extends StatefulWidget {
  DistrictGridPage({super.key});

  @override
  _DistrictGridPageState createState() => _DistrictGridPageState();
}

class _DistrictGridPageState extends State<DistrictGridPage> {
  dynamic lat, lon, sunRise, sunSet, wind;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              icon: Icon(Icons.exit_to_app))
        ],
        title: Text("Sylhet Division"),
        backgroundColor: Color.fromARGB(255, 71, 233, 248),
      ),
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          // ignore: unnecessary_new
          Expanded(
            child: GridView.extent(
              primary: false,
              padding: const EdgeInsets.all(14),
              crossAxisSpacing: 15,
              mainAxisSpacing: 40,
              maxCrossAxisExtent: 200.0,
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    height: 100,
                    width: 1000,
                    padding: const EdgeInsets.all(18),
                    alignment: Alignment.center,
                    // decoration: const BoxDecoration(
                    //   image: DecorationImage(
                    //     image: AssetImage("images/haze.png"),
                    //     fit: BoxFit.cover,
                    //     repeat: ImageRepeat.noRepeat,
                    //   ),
                    // ),
                    color: (Colors.amber),
                    child: Text(
                      "Sylhet",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  onTap: () {
                    Get.to(() => copyMainFile(),
                        arguments: ["24.894930", "91.868706"]);
                  },
                ),
                GestureDetector(
                  child: Container(
                    height: 100,
                    width: 1000,
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.center,
                    color: (Colors.amber),
                    child: Text(
                      "Habiganj",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  onTap: () {
                    Get.to(() => copyMainFile(),
                        arguments: ["24.3840", "91.4169"]);
                  },
                ),
                GestureDetector(
                  child: Container(
                    height: 100,
                    width: 1000,
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.center,
                    color: (Colors.amber),
                    child: Text(
                      "Sunamganj",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  onTap: () {
                    Get.to(() => copyMainFile(),
                        arguments: ["25.0662", "91.4073"]);
                  },
                ),
                GestureDetector(
                  child: Container(
                    height: 100,
                    width: 1000,
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.center,
                    color: (Colors.amber),
                    child: Text(
                      "Moulvibazar",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  onTap: () {
                    Get.to(() => copyMainFile(),
                        arguments: ["24.4843", "91.7685"]);
                  },
                ),
              ],
            ),
          ),

          ElevatedButton(onPressed: () {}, child: Text("Log out")),
          SizedBox(
            height: 20,
          )
        ],
      )),
      backgroundColor: Color.fromARGB(248, 245, 245, 245),
    );
  }
}
