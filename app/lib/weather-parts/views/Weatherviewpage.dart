import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../model/weather_clint.dart';
import '../model/weather_model.dart';
import '../weather-views-widgtes/additonal_info.dart';
import '../weather-views-widgtes/current_weather_get.dart';
import 'carefulMessageShow.dart';

// ignore: camel_case_types
class WeatherMainPage extends StatefulWidget {
  const WeatherMainPage({super.key});

  @override
  State<WeatherMainPage> createState() => _WeatherMainPageState();
}

// ignore: camel_case_types
class _WeatherMainPageState extends State<WeatherMainPage> {
  List<String> argss = Get.arguments;
  var lat, lon;

  WeatherAPiClinet client = WeatherAPiClinet();

  Weather? data;
  @override
  void initState() {
    super.initState();
    setState(() {
      lat = argss[0];
      lon = argss[1];
      getData();
    });
    // client.getCurrentWeather("24.894930", "91.868706");
    client.getCurrentWeather("$lat", "$lon");
  }

  // ignore: non_constant_identifier_names
  Future<void> getData() async {
    data = await client.getCurrentWeather("$lat", "$lon");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFf9f9f9),
        appBar: AppBar(
          backgroundColor: const Color(0xFFf9f9f9),
          elevation: 0.0,
          title: const Text(
            "Live Weather",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.blue,
            ),
            onPressed: () {
              //go to login section
              Navigator.of(context).pop();
            },
          ),
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              //here we will display our data
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    currentWeather(Icons.wb_sunny_rounded, "${data!.temp} °C",
                        "${data!.cityName}"),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Additional information about Weather ",
                        style: TextStyle(fontSize: 18)),
                    const Divider(
                      height: 10,
                    ),
                    additionalInformation(
                        "${data!.wind}",
                        "${data!.humidity}",
                        "${data!.pressure}",
                        "${data!.feels_like}",
                        "${data!.id}"),

                    clickMe("${data!.id}")

                    // now API Connections Established
                  ]);
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.none) {
              return const Center(
                child: Text("Mising weather"),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

Widget clickMe(dynamic data) {
  return Container(
    height: 90,
    width: 210,
    padding: EdgeInsets.all(20),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(252, 9, 227, 198),
          shadowColor: Color.fromARGB(240, 130, 55, 55)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.safety_check,
            color: Colors.purpleAccent,
            size: 40,
          ),
          Text(
            "For Safety",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
      onPressed: () {
        print(" i am here ${data}");
        Get.to(() => CarefullRulesPage(), arguments: data);
      },
    ),
  );
}
