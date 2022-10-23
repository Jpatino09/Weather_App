import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/providers/data_services.dart';

void main() => runApp(Data());

class Data extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataServicesProvider = Provider.of<DataServices>(context);

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
                onSubmitted: (value) {},
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
              width: 330,
              height: 250,
              child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
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
                    ),
                  )),
            ),
          ],
        ),
      ])),
    );
  }
}
