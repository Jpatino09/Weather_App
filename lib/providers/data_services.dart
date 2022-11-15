import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:weather_application/screens/home.dart';
import '../models/weather_by_city.dart';

//import 'package:weather_application/screens/cities.dart';

class DataServices extends ChangeNotifier {
  final String _urlSite = 'api.openweathermap.org';
  final String _segment = '/data/2.5/weather';

  String citySelected = '';
  String temp = '';
  String humidity = '';
  String windSpeed = '';
  String visibility = '';
  String weatherData = '';
  String timeZone = '';
  String assetUrl = '';
  bool loading = true;

  DataServices() {
    print('Inicialzando servicios');
    if (citySelected != '') {
      getServices_weather(citySelected);
    }
  }

  // ignore: non_constant_identifier_names
  Future getServices_weather(String citySelected) async {
    String city;
    city = citySelected;
    final queryparams = {
      'q': city,
      'appid': '5d55d5cbc3e7f16b0f685b815c9f0ec3',
      'units': 'metric'
    };

    var url = Uri.https(_urlSite, _segment, queryparams);

    final response = await http.get(url);

    final citiesResponse = WeatherByCity.fromJson(response.body);

    final decodedData =
        json.decode(response.body); // este creo que se puede borrar
    print(decodedData);
    temp = citiesResponse.main.temp.toString();
    humidity = citiesResponse.main.humidity.toString();
    windSpeed = citiesResponse.wind.speed.toString();
    visibility = citiesResponse.visibility.toString();
    weatherData = citiesResponse.weather[0].description;
    timeZone = citiesResponse.timezone.toString();
    citySelected = citiesResponse.name;

    assetUrl =
        'http://openweathermap.org/img/wn/${citiesResponse.weather[0].icon}@2x.png';

    notifyListeners();
  }
}
