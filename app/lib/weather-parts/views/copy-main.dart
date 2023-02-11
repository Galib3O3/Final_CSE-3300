import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../model/weather_clint.dart';
import '../model/weather_model.dart';
import '../weather-views-widgtes/additonal_info.dart';
import '../weather-views-widgtes/current_weather_get.dart';
import 'carefulMessageShow.dart';

// ignore: camel_case_types
class copyMainFile extends StatefulWidget {
  const copyMainFile({super.key});

  @override
  State<copyMainFile> createState() => _copyMainFileState();
}

// ignore: camel_case_types
class _copyMainFileState extends State<copyMainFile> {
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
    return Scaffold(
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
          onPressed: () {},
          icon: const Icon(Icons.menu),
          color: Colors.black,
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
                    height: 30,
                  ),
                  const Text("Additional information about Weather ",
                      style: TextStyle(fontSize: 21)),
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
              child: Text("Misi weather"),
            );
          }
          return Container();
        },
      ),
    );
  }
}

Widget clickMe(dynamic data) {
  return Container(
    height: 80,
    width: 250,
    child: ElevatedButton(
      child: Text("Click For Safety"),
      onPressed: () {
        print(" i am here ${data}");
        Get.to(() => CarefullRulesPage(), arguments: data);
      },
    ),
  );
}
