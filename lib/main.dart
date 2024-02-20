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
  String selectedConversion = 'Celcius to Reamur';
  double inputTemperature = 0.0;
  double outputTemperature = 0.0;

  void convertTemperature() {
    if (selectedConversion == 'Celcius to Reamur') {
      outputTemperature = inputTemperature * 0.8;
    } else if (selectedConversion == 'Reamur to Celcius') {
      outputTemperature = inputTemperature / 0.8;
    } else if (selectedConversion == 'Celcius to Kelvin') {
      outputTemperature = inputTemperature + 273.15;
    } else if (selectedConversion == 'Kelvin to Celcius') {
      outputTemperature = inputTemperature - 273.15;
    } else if (selectedConversion == 'Reamur to Kelvin') {
      outputTemperature = (inputTemperature / 0.8) + 273.15;
    } else if (selectedConversion == 'Kelvin to Reamur') {
      outputTemperature = (inputTemperature - 273.15) * 0.8;
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
            DropdownButton<String>(
              value: selectedConversion,
              onChanged: (newValue) {
                setState(() {
                  selectedConversion = newValue!;
                  convertTemperature();
                });
              },
              items: <String>[
                'Celcius to Reamur',
                'Reamur to Celcius',
                'Celcius to Kelvin',
                'Kelvin to Celcius',
                'Reamur to Kelvin',
                'Kelvin to Reamur',
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
              '$outputTemperature',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
