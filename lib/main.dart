import 'package:flutter/material.dart';
import 'package:weather_application/screens/cities.dart';
import 'package:weather_application/screens/data.dart';
import 'package:weather_application/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Weather App'),
        ),
      ),
      initialRoute: 'home',
      routes: {
        'home': (context) => Home(),
        'cities': (context) => Cities(),
        'data': (context) => Data(),
      },
    );
  }
}
