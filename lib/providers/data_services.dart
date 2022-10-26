import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../models/weather_by_city.dart';

//import 'package:weather_application/screens/cities.dart';

class DataServices extends ChangeNotifier {
  final String _urlSite = 'api.openweathermap.org';
  final String _segment = '/data/2.5/weather';

  String? getDataWeather;
  String citySelected = '';
  //String coordinatesLon = '';
  //String coordinatesLat = '';
  String temp = '';
  String humidity = '';
  String windSpeed = '';
  String visibility = '';
  String weatherData = '';
  String timeZone = '';

  DataServices() {
    print('Inicialzando servicios');
    getServices_weather(citySelected);
  }

  // ignore: non_constant_identifier_names
  void getServices_weather(String citySelected) async {
    String city;
    city = citySelected;
    final queryparams = {
      'q': city,
      'appid': '5d55d5cbc3e7f16b0f685b815c9f0ec3'
    };

    var url = Uri.https(_urlSite, _segment, queryparams);

    final response = await http.get(url);

    final citiesResponse = WeatherByCity.fromJson(response.body);

    final decodedData = json.decode(response.body); // este creo que se puede borrar
    print(decodedData);
    temp = citiesResponse.main.temp.toString();
    humidity = citiesResponse.main.humidity.toString();
    windSpeed = citiesResponse.wind.speed.toString();
    visibility = citiesResponse.visibility.toString();
    weatherData = citiesResponse.weather[0].description;
    timeZone = citiesResponse.timezone.toString();
    citySelected = citiesResponse.name;
    //coordinatesLon = 'Longitude: ' + citiesResponse.coord.lon.toString();
    //coordinatesLat = 'Latitude: ' + citiesResponse.coord.lat.toString();
    /* print('City Selected: ' + citySelected);
    print('Temperature: ' + temp + ' Kelvins');
    print('Humidity: ' + humidity + '%');
    print('Visibility: ' + visibility + 'Mts');
    print('Wind Speed: ' + windSpeed  + ' Mts/sec');
    print('Wheater Data: ' + weatherData);
    print('Time Zone: ' + timeZone); */
    notifyListeners();
  }
}
