import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

TextStyle fontSize19 =
    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
TextStyle fontSize14 = const TextStyle(
  fontSize: 16,
);

class CarefullRulesPage extends StatefulWidget {
  const CarefullRulesPage({super.key});

  @override
  State<CarefullRulesPage> createState() => _CarefullRulesPageState();
}

class _CarefullRulesPageState extends State<CarefullRulesPage> {
  int data = int.parse(Get.arguments);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(" Careful Informations "),
      ),
      body: selectFromData(data),
    ));
  }
}

Widget selectFromData(int data) {
  if (data == 800) {
    return clearSky800();
  } else if (data > 800 && data <= 850) {
    return overCast801();
  } else {
    return thunderSome800();
  }
}

Widget clearSky800() {
  return SingleChildScrollView(
    child: Center(
      child: Column(children: [
        SizedBox(
          height: 40,
        ),
        Container(
          height: 250,
          width: 350,
          child: clearSkyImage(),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          height: 300,
          width: 340,
          color: Color.fromARGB(255, 94, 156, 217),
          child: Column(
            children: [
              Divider(
                height: 10,
              ),
              Text(
                "Weather Status ID : 800",
                style: fontSize19,
              ),
              Divider(),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.add_alert_outlined,
                      color: Color.fromARGB(255, 27, 233, 8)),
                  Text(
                    " safe to engage in outdoor activities",
                    style: fontSize14,
                  )
                ],
              ),
              Divider(),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.add_alert_outlined,
                      color: Color.fromARGB(255, 27, 233, 8)),
                  Text(
                    " it's important to take precautions like",
                    style: fontSize14,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Icon(
                    Icons.label_important_sharp,
                    color: Colors.pink[700],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "wearing sunblock",
                    style: fontSize14,
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Icon(
                    Icons.label_important_sharp,
                    color: Colors.pink[700],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    " staying hydrated",
                    style: fontSize14,
                  )
                ],
              ),
              Divider(),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.add_alert_outlined,
                    color: Colors.red[900],
                  ),
                  Text(
                    " If the temperature is below 20 ",
                    style: fontSize14,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Icon(
                    Icons.label_important_sharp,
                    color: Colors.pink[700],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "wearing warm cloth",
                    style: fontSize14,
                  )
                ],
              ),
            ],
          ),
        ),
      ]),
    ),
  );
}

Widget thunderSome800() {
  return SingleChildScrollView(
    child: Center(
      child: Column(children: [
        SizedBox(
          height: 100,
        ),
        Container(
          height: 250,
          width: 350,
          child: thunderSomeImage(),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          height: 300,
          width: 350,
          color: Color.fromARGB(255, 11, 230, 186),
          child: Column(
            children: [
              Divider(
                height: 10,
              ),
              Text(
                "Thunderstorms (200 to 232)",
                style: fontSize19,
              ),
              Divider(),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.add_alert_outlined,
                      color: Color.fromARGB(255, 27, 233, 8)),
                  Text(
                    " important to stay indoors & avoid outdoor\n\tactivities",
                    style: fontSize14,
                  )
                ],
              ),
              Divider(),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.add_alert_outlined,
                      color: Color.fromARGB(255, 27, 233, 8)),
                  Text(
                    " If you must be outside",
                    style: fontSize14,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Icon(
                    Icons.label_important_sharp,
                    color: Colors.pink[700],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "avoid tall trees",
                    style: fontSize14,
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Icon(
                    Icons.label_important_sharp,
                    color: Colors.pink[700],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    " bodies of water",
                    style: fontSize14,
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Icon(
                    Icons.label_important_sharp,
                    color: Colors.pink[700],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    " metal objects",
                    style: fontSize14,
                  )
                ],
              ),
              Divider(),
            ],
          ),
        ),
      ]),
    ),
  );
}

Widget overCast801() {
  return SingleChildScrollView(
    child: Center(
      child: Column(children: [
        SizedBox(
          height: 100,
        ),
        Container(
          height: 250,
          width: 350,
          child: OverCastImage(),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          height: 330,
          width: 350,
          color: Color.fromARGB(255, 11, 230, 186),
          child: Column(
            children: [
              Divider(
                height: 25,
              ),
              Text(
                "Weather is overcast & typically Cloudy \n\t\t\tand Dull",
                style: fontSize19,
              ),
              Divider(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.add_alert_outlined,
                      color: Color.fromARGB(255, 233, 221, 10)),
                  Text(
                    " Depending on personal preferences \n\t\t\t activities",
                    style: fontSize14,
                  )
                ],
              ),
              Divider(),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.add_alert_outlined,
                      color: Color.fromARGB(255, 233, 221, 10)),
                  Text(
                    " You might follow ",
                    style: fontSize14,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Icon(
                    Icons.label_important_sharp,
                    color: Colors.pink[700],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Bring a light jacket or umbrella",
                    style: fontSize14,
                  )
                ],
              ),
              Divider(),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Icon(
                    Icons.label_important_sharp,
                    color: Colors.pink[700],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    " Wear sunglasses to protect \n\t\t\tfrom the glare of the clouds",
                    style: fontSize14,
                  )
                ],
              ),
              Divider(), //
              Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Icon(
                    Icons.label_important_sharp,
                    color: Colors.pink[700],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    " moody atmosphere and take the \n\t\t\topportunity for reflection",
                    style: fontSize14,
                  )
                ],
              ),
              Divider(),
            ],
          ),
        ),
      ]),
    ),
  );
}

Widget OverCastImage() {
  return CarouselSlider(items: [
    silderImage('assets/overcast-image/overcast-1.jpg'),
    silderImage('assets/overcast-image/overcast-2.jpg'),
    silderImage('assets/overcast-image/overcast-3.jpg'),
    silderImage('assets/overcast-image/overcast-4.jpg'),
    silderImage('assets/overcast-image/overcast-5.jpg'),
  ], options: _options());
}

//thundesome-image
//clear-image
Widget clearSkyImage() {
  return CarouselSlider(items: [
    silderImage('assets/clear-image/clear-1.png'),
    silderImage('assets/clear-image/clear-2.jpg'),
    silderImage('assets/clear-image/clear-3.png'),
  ], options: _options());
}

Widget thunderSomeImage() {
  return CarouselSlider(items: [
    //1st Image of Slider
    silderImage('assets/thundesome-image/thudersome-1.jpg'),
    silderImage('assets/thundesome-image/thudersome-2.jpg'),
    silderImage('assets/thundesome-image/thudersome-3.jpg'),
    silderImage('assets/thundesome-image/thudersome-4.jpg'),
    silderImage('assets/thundesome-image/thudersome-5.jpg'),
  ], options: _options());
}

Image silderImage(String path) {
  return Image.asset(
    '${path}',
    fit: BoxFit.cover,
    height: 240,
    width: 320,
  );
}

CarouselOptions _options() {
  return CarouselOptions(
    height: 180.0,
    enlargeCenterPage: true,
    autoPlay: true,
    aspectRatio: 16 / 9,
    autoPlayCurve: Curves.fastOutSlowIn,
    enableInfiniteScroll: true,
    autoPlayAnimationDuration: Duration(milliseconds: 800),
    viewportFraction: 0.8,
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

     If the weather is overcast, it is typically cloudy and dull. Depending on personal preferences and activities planned, one might consider the following options:

    Bring a light jacket or umbrella in case of occasional rain
    Wear sunglasses to protect from the glare of the clouds
    Find indoor activities or plan for indoor entertainment
    Enjoy the peaceful, moody atmosphere and take the opportunity for reflection or quiet time.

*/
 
  

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