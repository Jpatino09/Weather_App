// To parse this JSON data, do
//
//     final weatherByCity = weatherByCityFromMap(jsonString);

import 'dart:convert';

import 'package:weather_application/data/data.dart';

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
        coord: Coord.fromMap(json["coord"]),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromMap(x))),
        base: json["base"],
        main: Main.fromMap(json["main"]),
        visibility: json["visibility"],
        wind: Wind.fromMap(json["wind"]),
        clouds: Clouds.fromMap(json["clouds"]),
        dt: json["dt"],
        sys: Sys.fromMap(json["sys"]),
        timezone: json["timezone"],
        id: json["id"],
        name: json["name"],
        cod: json["cod"],
      );
}
