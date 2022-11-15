// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/data/coord.dart';
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

  String lat = '';
  String lon = '';
  Position? position;
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
                'Los servicios de localización están desactivados. Por favor, active los servicios')));
        return false;
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Los permisos de localización están denegados')));
          return false;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                'Los permisos de localización están denegados, no se pueden solicitar los permisos.')));
        return false;
      }
      return true;
    }

    // 6.330111-75.5670599
    Future<void> _showMyDialog() {
      //TODO: agregar parametro texto pocision,
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Ubicación'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text('Tu ubicación actual es: Latitud: $lat y Longitud: $lon'), // cambiar por la pocision
                  //  Text('Would you like to approve of this message?'),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text('Cerrar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    Future<void> _getCurrentPosition() async {
      final hasPermission = await _handleLocationPermission();
      if (!hasPermission) return;
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then((Position position) {
        lat = position.latitude.toString();
        lon = position.longitude.toString();
        _showMyDialog();
      }).catchError((e) {
        print('ERROR : ' + e.toString());
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
