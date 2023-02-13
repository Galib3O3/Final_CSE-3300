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
        title: Text(
          "   Sylhet Division",
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color.fromARGB(255, 71, 233, 248),
      ),
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Select One ",
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          // ignore: unnecessary_new
          Expanded(
            child: GridView.extent(
              primary: false,
              padding: const EdgeInsets.all(16),
              crossAxisSpacing: 15,
              mainAxisSpacing: 40,
              maxCrossAxisExtent: 180.0,
              children: <Widget>[
                GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: 180,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/zila-icon/sylhet.jpg"),
                            fit: BoxFit.cover,
                            repeat: ImageRepeat.noRepeat,
                          ),
                        ),
                      ),
                      Text(
                        "Sylhet",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  onTap: () {
                    Get.to(() => copyMainFile(),
                        arguments: ["24.894930", "91.868706"]);
                  },
                ),
                GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: 180,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/zila-icon/hobiganj.jpg"),
                            fit: BoxFit.cover,
                            repeat: ImageRepeat.noRepeat,
                          ),
                        ),
                      ),
                      Text(
                        "Habiganj",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  onTap: () {
                    Get.to(() => copyMainFile(),
                        arguments: ["24.3840", "91.4169"]);
                  },
                ),
                GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: 180,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/zila-icon/sunamganj.jpg"),
                            fit: BoxFit.cover,
                            repeat: ImageRepeat.noRepeat,
                          ),
                        ),
                      ),
                      Text(
                        "Sunamganj",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  onTap: () {
                    Get.to(() => copyMainFile(),
                        arguments: ["25.0662", "91.4073"]);
                  },
                ),
                GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: 180,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage("assets/zila-icon/moulvibazar.jpg"),
                            fit: BoxFit.cover,
                            repeat: ImageRepeat.noRepeat,
                          ),
                        ),
                      ),
                      Text(
                        "MoulviBazar",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  onTap: () {
                    Get.to(() => copyMainFile(),
                        arguments: ["24.4843", "91.7685"]);
                  },
                ),
              ],
            ),
          ),
        ],
      )),
      backgroundColor: Color.fromARGB(248, 245, 245, 245),
    );
  }
}
