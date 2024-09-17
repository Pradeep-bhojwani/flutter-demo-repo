import 'package:flutter/material.dart';

class fullcourse1 extends StatefulWidget {
  const fullcourse1({super.key});

  @override
  State<fullcourse1> createState() => _fullcourse1State();
}

class _fullcourse1State extends State<fullcourse1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo'),
      ),
      body: Container(
        child: Row(
          children: [
            TextButton(
              child: Text("click me"),
              onPressed: () {
                print("clicked");
              },
              onLongPress: () {
                print("long pressed");
              },
            ),
            ElevatedButton(
              child: Text("elevated button"),
              onPressed: () {
                print("pressed");
              },
            ),
            OutlinedButton(
              child: Text("OutlinedButton"),
              onPressed: () {
                print("pressed");
              },
            )
          ],
        ),
      ),
    );
  }
}
