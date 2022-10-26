import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/providers/data_services.dart';
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

  Data(String city) {
    selectedCity = city;
  }

  @override
  Widget build(BuildContext context) {
    temp = Provider.of<DataServices>(context).temp + ' kelvins';
    humidity = Provider.of<DataServices>(context).humidity + '%';
    windSpeed = Provider.of<DataServices>(context).windSpeed + ' Mts/sec';
    visibility = Provider.of<DataServices>(context).visibility + ' Mts';
    weatherData = Provider.of<DataServices>(context).weatherData;
    timeZone = Provider.of<DataServices>(context).timeZone;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
          body: Stack(children: [
        const SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image(
            fit: BoxFit.fill,
            image: AssetImage('assets/img/verano.jpeg'),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 170, bottom: 80, right: 30, left: 30),
              child: TextField(
                onChanged: (value) => {},
                style: const TextStyle(color: Colors.white),
                textInputAction: TextInputAction.search,
                onSubmitted: (value) {
                  Provider.of<DataServices>(context, listen: false).getServices_weather(value);
                  selectedCity = value;
                },
                decoration: InputDecoration(
                  suffix: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  hintStyle: const TextStyle(color: Colors.black),
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
            ),
            SizedBox(
              width: 250,
              height: 300,
              child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(height: 50),
                        Text(
                          'City Name: ' + selectedCity,
                          style: TextStyle(fontSize: 20, fontFamily: 'Play'),
                        ),
                        Text(
                          'Temperature: ' + temp,
                          style: TextStyle(fontSize: 15, fontFamily: 'Play'),
                        ),
                        Text(
                          'Humidity: ' + humidity,
                          style: TextStyle(fontSize: 15, fontFamily: 'Play'),
                        ),
                        Text(
                          'Visibility: ' + visibility,
                          style: TextStyle(fontSize: 15, fontFamily: 'Play'),
                        ),
                        Text(
                          'Wind Speed: ' + windSpeed,
                          style: TextStyle(fontSize: 15, fontFamily: 'Play'),
                        ),
                        Text(
                          'Timezone: ' + timeZone,
                          style: TextStyle(fontSize: 15, fontFamily: 'Play'),
                        ),
                        Text(
                          'Weather Data: ' + weatherData,
                          style: TextStyle(fontSize: 15, fontFamily: 'Play'),
                        ),
                        const Icon(
                          Icons.sunny_snowing,
                          size: 60,
                          color: Color.fromARGB(255, 230, 186, 74),
                        ),
                      ],
                    ),
                  )),
            ),
            const SizedBox(height: 50),
            ElevatedButton(onPressed: () { 
              final route = MaterialPageRoute(builder: (context) => Home());
              Navigator.push(context, route);
            }, child: const Icon(
                Icons.home,
                color: Colors.black,
            ))
          ],
        ),
      ])),
    );
  }
}
