import 'package:flutter/material.dart';
import '../weather-views-widgtes/current_weather_get.dart';

import '../model/weather_clint.dart';
import '../model/weather_model.dart';
import 'additonal_info.dart';

// ignore: camel_case_types
class main_page_doctor_code extends StatefulWidget {
  const main_page_doctor_code({super.key});

  @override
  State<main_page_doctor_code> createState() => _main_page_doctor_codeState();
}

// ignore: camel_case_types
class _main_page_doctor_codeState extends State<main_page_doctor_code> {
  // now lets test if everything is working
  // we call api in the hare working
  WeatherAPiClinet client = WeatherAPiClinet();
  // ALhamdullilah everything is working now
  //but we will use a better method to call api
  //FutureBuilder

  @override
  void initState() {
    super.initState();
    client.getCurrentWeather("24.894930", "91.868706");
  }

  Weather? data;
  // ignore: non_constant_identifier_names
  Future<void> getData() async {
    data = await client.getCurrentWeather("24.894930", "91.868706");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf9f9f9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFf9f9f9),
        elevation: 0.0,
        title: const Text(
          "Weather app test ",
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
                  const Text("Additional weather information  ",
                      style: TextStyle(fontSize: 21)),
                  const Divider(),
                  additionalInformation(
                      "${data!.wind}",
                      "${data!.humidity}",
                      "${data!.pressure}",
                      "${data!.feels_like}",
                      "${data!.id}"),
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
