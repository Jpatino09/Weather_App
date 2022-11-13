import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/providers/data_services.dart';
import 'package:weather_application/screens/cities.dart';
import 'package:weather_application/screens/data.dart';
import 'package:weather_application/screens/home.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DataServices(),
          // lazy: false,
        ),
      ],
      child: MyApp(),
    );
  }
}

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
        'data': (context) =>
            Data(Provider.of<DataServices>(context).citySelected),
      },
    );
  }
}
