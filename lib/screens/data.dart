import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/providers/data_services.dart';
import 'cities.dart';
import 'home.dart';

void main() => runApp(Data(''));

class Data extends StatelessWidget {
  String selectedCity = '';
  String temp = '';
  String humidity = '';
  String windSpeed = '';
  String visibility = '';
  String weatherData = '';
  String timeZone = '';

  Data(String city);

  @override
  Widget build(BuildContext context) {
    temp = '${Provider.of<DataServices>(context).temp}°';
    humidity = '${Provider.of<DataServices>(context).humidity}%';
    windSpeed = '${Provider.of<DataServices>(context).windSpeed} Mts/sec';
    visibility = '${Provider.of<DataServices>(context).visibility} Mts';
    weatherData = Provider.of<DataServices>(context).weatherData;
    timeZone = Provider.of<DataServices>(context).timeZone;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          body: Stack(children: [
            const SizedBox(
              height: double.infinity,
              width: double.infinity,
            ),
            Stack(children: [
              SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    TextField(
                      onChanged: (value) => {},
                      style: const TextStyle(color: Colors.white),
                      textInputAction: TextInputAction.search,
                      onSubmitted: (value) {
                        Provider.of<DataServices>(context, listen: false)
                            .getServices_weather(value);
                        selectedCity = value.toUpperCase();
                      },
                      decoration: InputDecoration(
                        suffix: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        hintStyle: const TextStyle(color: Colors.white),
                        hintText: 'search'.toUpperCase(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      width: 270,
                      height: 280,
                      child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              Text(
                                selectedCity,
                                style: const TextStyle(
                                    fontSize: 20, fontFamily: 'Play'),
                              ),
                              Image.network(
                                Provider.of<DataServices>(context).assetUrl,
                              ),
                              Text(
                                'Temperature: $temp',
                                style: const TextStyle(
                                    fontSize: 15, fontFamily: 'Play'),
                              ),
                              Text(
                                'Humidity: $humidity',
                                style: const TextStyle(
                                    fontSize: 15, fontFamily: 'Play'),
                              ),
                              Text(
                                'Visibility: $visibility',
                                style: const TextStyle(
                                    fontSize: 15, fontFamily: 'Play'),
                              ),
                              Text(
                                'Wind Speed: $windSpeed',
                                style: const TextStyle(
                                    fontSize: 15, fontFamily: 'Play'),
                              ),
                              Text(
                                'Timezone: $timeZone',
                                style: const TextStyle(
                                    fontSize: 15, fontFamily: 'Play'),
                              ),
                              Text(
                                'Weather Data: $weatherData',
                                style: const TextStyle(
                                    fontSize: 15, fontFamily: 'Play'),
                              ),
                            ],
                          )),
                    ),
                    const SizedBox(height: 25),
                    ElevatedButton(
                        onPressed: () {
                          final route =
                              MaterialPageRoute(builder: (context) => Home());
                          Navigator.push(context, route);
                        },
                        child: const Icon(
                          Icons.home,
                          color: Colors.black,
                        ))
                  ],
                ),
              ),
            ]),
          ])),
    );
  }
}
