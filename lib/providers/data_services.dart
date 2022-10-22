import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:weather_application/models/weather_by_city.dart';
//import 'package:weather_application/screens/cities.dart';

class DataServices extends ChangeNotifier {
  final String _urlSite = 'api.openweathermap.org';
  final String _segment = '/data/2.5/weather';

  DataServices() {
    print('Inicialzando servicios');

    getServices_weather('Medellin');
  }

  // ignore: non_constant_identifier_names
  void getServices_weather(String city) async {
    final queryparams = {
      'q': city,
      'appid': '5d55d5cbc3e7f16b0f685b815c9f0ec3'
    };

    var url = Uri.https(_urlSite, _segment, queryparams);

    final response = await http.get(url);

    final citiesResponse = WeatherByCity.fromJson(response.body);

    //final Map<String, dynamic> decodedData = json.decode(response.body);
    print(citiesResponse);
  }
}
