import 'package:flutter/material.dart';

class circular extends StatefulWidget {
  const circular({super.key});

  @override
  State<circular> createState() => _circularState();
}

class _circularState extends State<circular> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circular'),
      ),
      body: Center(
        child: CircleAvatar(
          backgroundImage: AssetImage(
              '/Users/prismetric/Desktop/Flutter_Demo_Projects/Jillii_Hybrid/jilli/assets/image/alon1.png'),
          backgroundColor: Colors.black45,
          radius: 100,
        ),
      ),
    );
  }
}
