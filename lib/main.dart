import 'package:flutter/material.dart';

void main() {
  runApp(SimpleConverter());
}

class SimpleConverter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Temperature Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ConverterPage(),
    );
  }
}

class ConverterPage extends StatefulWidget {
  @override
  _ConverterPageState createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  String selectedInput = 'Celsius';
  double inputTemperature = 0.0;
  double outputTemperature = 0.0;

  void convertTemperature() {
    if (selectedInput == 'Celsius') {
      outputTemperature = (inputTemperature * 9 / 5) + 32; // Celsius to Fahrenheit
    } else if (selectedInput == 'Fahrenheit') {
      outputTemperature = (inputTemperature - 32) * 5 / 9; // Fahrenheit to Celsius
    } else if (selectedInput == 'Reamur') {
      outputTemperature = inputTemperature * 5 / 4; // Reamur to Celsius
    } else if (selectedInput == 'Kelvin') {
      outputTemperature = inputTemperature - 273.15; // Kelvin to Celsius
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Converter'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Select Input:',
              style: TextStyle(fontSize: 16.0),
            ),
            DropdownButton<String>(
              value: selectedInput,
              onChanged: (newValue) {
                setState(() {
                  selectedInput = newValue!;
                  convertTemperature();
                });
              },
              items: <String>[
                'Celsius',
                'Fahrenheit',
                'Reamur',
                'Kelvin',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            Text(
              'Input Temperature:',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  inputTemperature = double.tryParse(value) ?? 0.0;
                  convertTemperature();
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter temperature',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Output Temperature:',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Fahrenheit: ${(selectedInput == 'Celsius') ? outputTemperature : (selectedInput == 'Fahrenheit') ? inputTemperature : (selectedInput == 'Reamur') ? outputTemperature * 9 / 5 + 32 : outputTemperature + 273.15}\n'
              'Reamur: ${(selectedInput == 'Celsius') ? outputTemperature * 4 / 5 : (selectedInput == 'Fahrenheit') ? (inputTemperature - 32) * 4 / 9 : outputTemperature * 4 / 5}\n'
              'Kelvin: ${(selectedInput == 'Celsius') ? outputTemperature + 273.15 : (selectedInput == 'Fahrenheit') ? (inputTemperature - 32) * 5 / 9 + 273.15 : outputTemperature}',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
