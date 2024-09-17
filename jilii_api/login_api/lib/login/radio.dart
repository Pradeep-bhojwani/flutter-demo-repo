import 'package:flutter/material.dart';

class RadioButtonExample extends StatefulWidget {
  @override
  _RadioButtonExampleState createState() => _RadioButtonExampleState();
}

class _RadioButtonExampleState extends State<RadioButtonExample> {
  // Variable to hold the selected value
  int _selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Button Example'),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Option 1'),
            leading: Radio<int>(
              value: 1,
              groupValue: _selectedOption ,
              onChanged: (int? value) {
                setState(() {
                  _selectedOption = value!;
                  print(_selectedOption);
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Option 2'),
            leading: Radio<int>(
              value: 2,
              groupValue: _selectedOption,
              onChanged: (int? value) {
                setState(() {
                  _selectedOption = value!;
                  print(_selectedOption);
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Option 3'),
            leading: Radio<int>(
              value: 3,
              groupValue: _selectedOption,
              onChanged: (int? value) {
                setState(() {
                  _selectedOption = value!;
                  print(_selectedOption);
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Selected option: $_selectedOption',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
