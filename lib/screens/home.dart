import 'package:flutter/material.dart';

import 'cities.dart';

void main() => runApp(Home());

Text name = const Text('');

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 163, 187, 206),
            child: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.blue,
            ),
            onPressed: () {
              final route = MaterialPageRoute(builder: (context) => Cities());
              Navigator.push(context, route);
            }),
        body: Stack(children: [
          Container(
            color: Colors.blue,
            height: double.infinity,
            width: double.infinity,
            child: const Opacity(
              opacity: 1,
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage('assets/verano.jpeg'),
              ),
            ),
          ),
          Center(
              child: name = const Text(
            'Weather App',
            style: TextStyle(fontSize: 40),
          )),
        ]),
      ),
    );
  }
}
