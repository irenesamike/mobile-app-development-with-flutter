import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      home: BmiCalculator(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BmiCalculator extends StatefulWidget {
  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  double height = 0;
  double weight = 0;
  double bmi = 0;
  String category = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/marasonimg.png'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 30.0),
            Text(
              'Your BMI is $bmi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
            ),
            Text(
              'Category: $category',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white70),
            ),
            SizedBox(height: 70.0),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter your height in centimeters',
                labelText: 'Height (cm)',

              ),
              onChanged: (value) {
                height = double.parse(value);
              },
              style: TextStyle(
                color: Colors.white60,
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter your weight in kilograms',
                labelText: 'Weight (kg)',
              ),
              onChanged: (value) {
                weight = double.parse(value);
              },
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 100.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black12,
                onPrimary: Colors.white,
              ),
              onPressed: () {
                calculateBMI();
              },
              child: Text('Calculate BMI'),
            ),
          ],
        ),
      ),
    );
  }

  void calculateBMI() {
    bmi = weight / (height / 100 * height / 100);

    if (bmi < 18.5) {
      category = "Underweight";
    } else if (bmi >= 18.5 && bmi < 25) {
      category = "Healthy Weight";
    } else if (bmi >= 25 && bmi < 30) {
      category = "Overweight";
    } else if (bmi >= 30 && bmi < 35) {
      category = "Obese";
    } else if (bmi >= 35 && bmi < 40) {
      category = "Severely Obese";
    } else if (bmi >= 40) {
      category = "Morbidly Obese";
    }

    setState(() {});
  }
}
