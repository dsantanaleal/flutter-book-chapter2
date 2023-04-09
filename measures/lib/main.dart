import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(MeasuresApp());

class MeasuresApp extends StatefulWidget {

  @override
  MyAppState createState() => MyAppState();

}

class MyAppState extends State<MeasuresApp> {

  double? _numberFrom;
  var fruits = {"Orange", "Apple", "Strawberry", "Banana"};
  String? fruitSelected;

  final List<String> _measures = [
    'meters', 'kilometers', 'grams', 'kilograms', 'feet', 'miles', 'pounds (lbs)', 'ounces'
  ];

  @override
  void initState() {
    super.initState();
    _numberFrom = 1.0;
    fruitSelected = fruits.elementAt(0);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Measures App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Measures App'),
        ),
        body: Builder(
          builder: (context) => 
            Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: [
                    TextField(
                      onChanged: (value) {
                        double? rv = double.tryParse(value);
                        if(rv == null) {
                          rv = 0.0;
                        }
                        setState(() {
                          _numberFrom = rv;
                        });
                      },
                    ),
                    Text('$_numberFrom'),
                    DropdownButton<String>(
                      items: _measures.map((measure) => DropdownMenuItem<String>(value: measure, child: Text(measure))).toList(),
                      onChanged: (value) => {},
                    ),
                    DropdownButton<String>(
                      items: fruits.map((fruit) => DropdownMenuItem<String>(value: fruit, child: Text(fruit),)).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          fruitSelected = newValue;
                        });
                      },
                      value: fruitSelected,
                    )
                  ]
                )
              ),
            )
          ,
        )
      ),
    );
  }
}