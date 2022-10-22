import 'package:flutter/material.dart';

void main() => runApp(Data());

class Data extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
          body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image(
          fit: BoxFit.cover,
          image: AssetImage('assets/verano.jpeg'),
        ),
      )),
    );
  }
}
