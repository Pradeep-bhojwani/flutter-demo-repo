import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  print("working");
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
      child: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Container(
                        height: 100,
                        color: Colors.white,
                        child: const Center(child: Text("Test Data")))),
                const SizedBox(
                  height: 10,
                ),
                Center(
                    child: Container(
                        height: 100,
                        color: Colors.white,
                        child: const Center(child: Text("Test Data")))),
              ],
            ),
          )),
    ));
  }
}
