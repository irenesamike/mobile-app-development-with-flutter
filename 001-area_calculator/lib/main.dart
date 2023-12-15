import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circle Area Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController radiusController = TextEditingController();
  double area = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circle Area Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: radiusController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Radius (meters)'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                calculateArea();
              },
              child: Text('Calculate Area'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Area: $area sq. meters',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void calculateArea() {
    double radius = double.tryParse(radiusController.text) ?? 0.0;
    double calculatedArea = pow(radius, 2) * pi;
    setState(() {
      area = calculatedArea;
    });

    _showResultDialog(area);
  }

  void _showResultDialog(double area) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Result'),
          content: Text('The area of the circle is $area sq. meters.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
