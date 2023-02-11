import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CarefullRulesPage extends StatefulWidget {
  const CarefullRulesPage({super.key});

  @override
  State<CarefullRulesPage> createState() => _CarefullRulesPageState();
}

class _CarefullRulesPageState extends State<CarefullRulesPage> {
  dynamic data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(child: imageViewWidge()),
    ));
  }
}

Widget imageViewWidge() {
  return Center(
    child: Container(
      height: 300,
      width: 300,
      color: Color.fromARGB(255, 7, 255, 123),
      child: Column(
        children: [
          Text("Weather Status is : 800"),
          Divider(),
          Text("Clear SKY"),
        ],
      ),
    ),
  );
}

 
  

/*
    Thunderstorms (200 to 232): 
    When thunderstorms occur, 
    it's important to stay indoors and avoid outdoor activities.
     If you must be outside, avoid tall trees, bodies of water, 
     and metal objects.


    Drizzle (300 to 321): 
    During drizzle, it's important to carry an umbrella or wear a raincoat to stay dry.
     Avoid outdoor activities if the precipitation is heavy,
      as it can make driving and walking difficult.

    Rain (500 to 531): 
    During rain, it's important to carry an umbrella or wear a raincoat to stay dry. 
    Slow down while driving, as roads can be slick and visibility can be reduced.

     
    Atmosphere (701 to 781):
    
    During atmospheric conditions such as mist, fog, and sand or dust storms, 
    it's important to be careful while driving, as visibility can be reduced.
    Wear protective gear if necessary, such as a face mask during a sandstorm.

    Clear (800):

     When skies are clear, it's generally safe to engage in outdoor activities, 
     but it's still important to take precautions such as wearing sunblock 
     and staying hydrated.

*/