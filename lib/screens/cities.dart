import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/data_services.dart';
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
    'Moscu',
    'Lisboa',
    'Madrid',
    'Amsterdam',
    'Chicago',
    'Osaka',
    'Lima',
    'Buenos Aires',
    'Brasilia',
    'Managua'
  ];

  @override
  Widget build(BuildContext context) {
    Color? splashColor;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: SafeArea(
        top: true,
        bottom: true,
        child: Scaffold(
            backgroundColor: Color.fromARGB(255, 89, 134, 171),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniEndDocked,
            floatingActionButton: FloatingActionButton(
              splashColor: Colors.black,
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.location_on_rounded,
                color: Color.fromARGB(255, 34, 102, 158),
              ),
              onPressed: () {
                final route = MaterialPageRoute(builder: (context) => Data(Provider.of<DataServices>(context).citySelected));
                Navigator.push(context, route);
                splashColor = Colors.red;
              },
            ),
            body: Stack(
              children: [
                SafeArea(
                  child: ListView(
                    children: [
                      ...cities.map((city) => ListTile(
                            title: Text(
                              city,
                              style: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontFamily: 'Play'),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                            ),
                            leading: const Icon(
                              Icons.location_on_rounded,
                              color: Colors.white,
                            ),
                            onTap: () {
                              Provider.of<DataServices>(context, listen: false).getServices_weather(city);
                              final route = MaterialPageRoute(
                                  builder: (context) => Data(city));
                              Navigator.push(context, route);
                            },
                          ))
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
