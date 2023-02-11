class Weather {
  dynamic id;
  String? cityName;
  double? temp;
  double? wind;
  int? pressure;
  int? humidity;
  // ignore: non_constant_identifier_names
  double? feels_like;

  Weather(
      {this.id,
      this.cityName,
      this.temp,
      this.wind,
      this.pressure,
      this.humidity,
      // ignore: non_constant_identifier_names
      this.feels_like});

  //now lests build a functions where the JSON file into the model

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['weather'][0]['id'];
    cityName = json["name"];
    temp = json["main"]["temp"];
    wind = json["wind"]["speed"];
    pressure = json["main"]["pressure"];
    humidity = json["main"]["humidity"];
    feels_like = json["main"]["feels_like"];
  }
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