import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../model/weather_clint.dart';
import '../model/weather_model.dart';
import '../weather-views-widgtes/additonal_info.dart';
import '../weather-views-widgtes/current_weather_get.dart';

// ignore: camel_case_types
class weatherSyl extends StatefulWidget {
  const weatherSyl({super.key});
  @override
  State<weatherSyl> createState() => _weatherSylState();
}

// ignore: camel_case_types
class _weatherSylState extends State<weatherSyl> {
  var argsP = Get.arguments;
  var lat, lon, crossId, carefeulMessage, wearCloth;
  WeatherAPiClinet client = WeatherAPiClinet();

  void LatLon(String? place) {
    switch (place) {
      case "sylhet":
        {
          setState(() {
            lat = "24.894930";
            lon = "91.868706";
          });
        }
        break;
      case "habiganj":
        {
          setState(() {
            lat = "24.3840";
            lon = "91.4169";
          });
        }
        break;
      case "sunamganj":
        {
          setState(() {
            lat = "25.0662"; //91.4073
            lon = "91.3961";
          });
        }
        break;
      case "moulvibazar":
        {
          setState(() {
            lat = "24.4843"; //,
            lon = "91.7685";
          });
        }
        break;
      default:
        {
          print("Invalid choice");
        }
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    LatLon(argsP);
    client.getCurrentWeather(lat, lon);
    print(argsP);
  }

  Weather? data;
  // ignore: non_constant_identifier_names
  Future<void> getData() async {
    data = await client.getCurrentWeather(lat, lon);
    setState(() {
      crossId = data!.id;
    });
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
                  "${data!.id}",
                ),
                // now API Connections Established
                // imageViewWidge(),
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            if (snapshot.hasError)
              return Center(
                child: Text(snapshot.hasError.toString()),
              );

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
