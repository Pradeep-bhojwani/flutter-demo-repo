import 'package:flutter/material.dart';


class CheckBoxExample extends StatefulWidget {
  @override
  _CheckBoxExampleState createState() => _CheckBoxExampleState();
}

class _CheckBoxExampleState extends State<CheckBoxExample> {
  // Variables to track the checkbox states
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox Example'),
      ),
      body: Column(
        children: <Widget>[
          CheckboxListTile(
            title: Text('Option 1'),
            value: _isChecked1,
            onChanged: (bool? value) {
              setState(() {
                _isChecked1 = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Option 2'),
            value: _isChecked2,
            onChanged: (bool? value) {
              setState(() {
                _isChecked2 = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Option 3'),
            value: _isChecked3,
            onChanged: (bool? value) {
              setState(() {
                _isChecked3 = value!;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Selected Options:\n'
              'Option 1: ${_isChecked1 ? "Checked" : "Unchecked"}\n'
              'Option 2: ${_isChecked2 ? "Checked" : "Unchecked"}\n'
              'Option 3: ${_isChecked3 ? "Checked" : "Unchecked"}',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
