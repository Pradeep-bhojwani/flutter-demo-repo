import 'package:flutter/material.dart';

class inkwell extends StatefulWidget {
  const inkwell({super.key});

  @override
  State<inkwell> createState() => _inkwellState();
}

class _inkwellState extends State<inkwell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Inkwell"),
        ),
        body: InkWell(
          onTap: () {
            print("clicked");
          },
          onLongPress: () {
            print('lomng');
          },
          child: Container(
            width: 100,
            height: 100,
            color: Colors.amber,
          ),
        ));
  }
}
