import 'package:flutter/material.dart';
import 'package:weather_application/models/weather_by_city.dart';

class CardData extends StatelessWidget {
  final WeatherByCity data;

  const CardData({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: const [
            Text(
              'Name City',
              style: TextStyle(fontSize: 28, fontFamily: 'Play'),
            ),
            Icon(
              Icons.sunny_snowing,
              size: 60,
              color: Color.fromARGB(255, 230, 186, 74),
            ),
          ],
        ));
  }
}
