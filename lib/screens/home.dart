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
            backgroundColor: Color.fromARGB(255, 89, 134, 171),
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
            color: Color.fromARGB(255, 34, 102, 158),
            height: double.infinity,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 250, bottom: 200, right: 50, left: 50),
            child: Column(
              children: const [
                CircleAvatar(
                    radius: 120,
                    backgroundImage: NetworkImage(
                        'https://us.123rf.com/450wm/benchart/benchart1611/benchart161100031/68606083-ilustraci%C3%B3n-de-un-fondo-de-cielo-dibujos-animados-con-el-sol-que-brilla-detr%C3%A1s-de-una-nube.jpg?ver=6')),

                //child: Image(image: AssetImage()) ),
                Center(
                    child: Text(
                  'Weather App',
                  style: TextStyle(
                      fontSize: 44, fontFamily: 'Play', color: Colors.white),
                )),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
