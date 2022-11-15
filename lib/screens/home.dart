import 'package:flutter/material.dart';

import 'cities.dart';

void main() => runApp(const Home());

Text name = const Text('');

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 89, 134, 171),
            child: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
            onPressed: () {
              final route = MaterialPageRoute(builder: (context) => Cities());
              Navigator.push(context, route);
            }),
        body: Stack(children: [
          Container(
            color: Colors.white, //Color.fromARGB(255, 12, 12, 12),
            height: double.infinity,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 180, bottom: 125, right: 50, left: 50),
            child: Column(
              children: [
                CircleAvatar(
                    radius: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(120),
                        child: const Image(
                            image: AssetImage('assets/img/soleado.jpg')))),
                const Center(
                    child: Text(
                  'Weather App',
                  style: TextStyle(
                      fontSize: 44, fontFamily: 'Play', color: Colors.black),
                )),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
