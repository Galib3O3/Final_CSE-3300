//to start call some http request in flutter we need to http pacakge

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/weather_model.dart';

class WeatherAPiClinet {
  Future<Weather>? getCurrentWeather(String? lati, String? loni) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$lati&lon=$loni&appid=74e7c3a1e8f06f40b24cc4a81b032d3a&units=metric");
    var response = await http.get(endpoint);

    var body = jsonDecode(response.body);

    Weather weather = Weather.fromJson(body);

    print(weather.cityName);
    return weather;
  }
}
