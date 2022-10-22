import 'package:flutter/material.dart';

import 'data.dart';

void main() => runApp(Cities());

class Cities extends StatelessWidget {
  final cities = [
    'Medellin',
    'Bogota',
    'Cali',
    'Londres',
    'Quito',
    'La Habana',
    'Moscu'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
          body: Stack(
        children: [
          const Opacity(
            opacity: 0.6,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage('assets/verano.jpeg'),
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          ListView(
            children: [
              ...cities.map((listCities) => ListTile(
                    title: Text(listCities),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    onTap: () {
                      final route =
                          MaterialPageRoute(builder: (context) => Data());
                      Navigator.push(context, route);
                    },
                  ))
            ],
          ),
        ],
      )),
    );
  }
}
