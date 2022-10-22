// To parse this JSON data, do
//
//     final weatherByCity = weatherByCityFromMap(jsonString);

import 'dart:convert';

class WeatherByCity {
  WeatherByCity({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  Coord coord;
  List<Weather> weather;
  String base;
  Main main;
  int visibility;
  Wind wind;
  Clouds clouds;
  int dt;
  Sys sys;
  int timezone;
  int id;
  String name;
  int cod;

  factory WeatherByCity.fromJson(String str) =>
      WeatherByCity.fromMap(json.decode(str));

  factory WeatherByCity.fromMap(Map<String, dynamic> json) => WeatherByCity(
        coord: json["coord"] = Coord.fromMap(json["coord"]),
        weather: json["weather"] =
            List<Weather>.from(json["weather"].map((x) => Weather.fromMap(x))),
        base: json["base"],
        main: json["main"] = Main.fromMap(json["main"]),
        visibility: json["visibility"],
        wind: json["wind"] = Wind.fromMap(json["wind"]),
        clouds: json["clouds"] = Clouds.fromMap(json["clouds"]),
        dt: json["dt"],
        sys: json["sys"] = Sys.fromMap(json["sys"]),
        timezone: json["timezone"],
        id: json["id"],
        name: json["name"],
        cod: json["cod"],
      );
}

class Clouds {
  Clouds({
    required this.all,
  });

  int all;

  factory Clouds.fromJson(String str) => Clouds.fromMap(json.decode(str));

  factory Clouds.fromMap(Map<String, dynamic> json) => Clouds(
        all: json["all"],
      );
}

class Coord {
  Coord({
    required this.lon,
    required this.lat,
  });

  double lon;
  double lat;

  factory Coord.fromJson(String str) => Coord.fromMap(json.decode(str));

  factory Coord.fromMap(Map<String, dynamic> json) => Coord(
        lon: json["lon"].toDouble(),
        lat: json["lat"].toDouble(),
      );
}

class Main {
  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;
  int? seaLevel;
  int? grndLevel;

  factory Main.fromJson(String str) => Main.fromMap(json.decode(str));

  factory Main.fromMap(Map<String, dynamic> json) => Main(
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        tempMin: json["temp_min"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
        seaLevel: json["sea_level"],
        grndLevel: json["grnd_level"],
      );
}

class Sys {
  Sys({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  int type;
  int id;
  String country;
  int sunrise;
  int sunset;

  factory Sys.fromJson(String str) => Sys.fromMap(json.decode(str));

  factory Sys.fromMap(Map<String, dynamic> json) => Sys(
        type: json["type"],
        id: json["id"],
        country: json["country"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );
}

class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  int id;
  String main;
  String description;
  String icon;

  factory Weather.fromJson(String str) => Weather.fromMap(json.decode(str));

  factory Weather.fromMap(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );
}

class Wind {
  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  double speed;
  int deg;
  double gust;

  factory Wind.fromJson(String str) => Wind.fromMap(json.decode(str));

  factory Wind.fromMap(Map<String, dynamic> json) => Wind(
        speed: json["speed"],
        deg: json["deg"],
        gust: json["gust"].toDouble(),
      );
}
