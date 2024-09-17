import 'package:flutter/material.dart';

class custom_alert extends StatefulWidget {
  const custom_alert({super.key});

  @override
  State<custom_alert> createState() => _custom_alertState();
}

class _custom_alertState extends State<custom_alert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom_text'),
      ),
      body: Center(
        child: Text(
          'Sunny Bhojwani',
          style: TextStyle(fontFamily: 'cursive-write', fontSize: 40),
        ),
      ),
    );
  }
}
