// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/data_services.dart';
import 'package:geolocator/geolocator.dart';
import 'data.dart';

void main() => runApp(Cities());

class Cities extends StatefulWidget {
  @override
  State<Cities> createState() => _CitiesState();
}

class _CitiesState extends State<Cities> {
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

  String? _currentAddress;

  Position? _currentPosition;

  @override
  Widget build(BuildContext context) {
    Color? splashColor;

    Future<bool> _handleLocationPermission() async {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                'Location services are disabled. Please enable the services')));
        return false;
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Location permissions are denied')));
          return false;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                'Location permissions are permanently denied, we cannot request permissions.')));
        return false;
      }
      return true;
    }

    Future<void> _getCurrentPosition() async {
      final hasPermission = await _handleLocationPermission();
      if (!hasPermission) return;
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then((Position position) {
        setState(() => _currentPosition = position);
      }).catchError((e) {
        debugPrint(e);
      });
    }

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
                _getCurrentPosition();
                print(_currentAddress);
                print(_currentPosition.toString());
                final route = MaterialPageRoute(
                    builder: (context) =>
                        Data(Provider.of<DataServices>(context).citySelected));
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
                              Provider.of<DataServices>(context, listen: false)
                                  .getServices_weather(city);
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
