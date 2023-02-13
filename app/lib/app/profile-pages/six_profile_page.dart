import 'dart:ui';
import 'package:app/Dontaion/donation1.dart';
import 'package:app/LocationAndVolunterrs/SylhetRegion.dart';
import 'package:app/about_us/about_us.dart';
import 'package:app/app/profile-pages/liveChatADH/livechat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../Dontaion/donation.dart';

class SixProfileView extends StatefulWidget {
  SixProfileView({super.key});

  @override
  _SixProfileViewState createState() => _SixProfileViewState();
}

class _SixProfileViewState extends State<SixProfileView> {
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
        title: Center(child: Text("HOME PAGE")),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 40,
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
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/clouds_sun.png"),
                            fit: BoxFit.cover,
                            repeat: ImageRepeat.noRepeat,
                          ),
                        ),
                      ),
                      Text(
                        "weather",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  onTap: () {
                    //Get.to(() => WeatherMainPageView());
                  }),
              GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/shelter.png"),
                            fit: BoxFit.cover,
                            repeat: ImageRepeat.noRepeat,
                          ),
                        ),
                      ),
                      Text(
                        "Shelter",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      // Get.to(MyHomePage(title: 'Flutter Demo Home Page'));
                    });
                  }),
              GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/volunteer.png"),
                            fit: BoxFit.cover,
                            repeat: ImageRepeat.noRepeat,
                          ),
                        ),
                      ),
                      Text(
                        "Volunteer",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      Get.to(get_d());
                    });
                  }),
              GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/donation.png"),
                            fit: BoxFit.cover,
                            repeat: ImageRepeat.noRepeat,
                          ),
                        ),
                      ),
                      Text(
                        "Donation",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      Get.to(donation());
                    });
                  }),
              GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/LC.png"),
                            fit: BoxFit.cover,
                            repeat: ImageRepeat.noRepeat,
                          ),
                        ),
                      ),
                      Text(
                        "Live Chat",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      Get.to(livecaht());
                      //Get.to(MyHomePage(title: 'Flutter Demo Home Page'));
                    });
                  }),
              GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/about_us.png"),
                            fit: BoxFit.cover,
                            repeat: ImageRepeat.noRepeat,
                          ),
                        ),
                      ),
                      Text(
                        "about us",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      Get.to(RowCol_11());
                    });
                  }),
            ],
          )),
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
