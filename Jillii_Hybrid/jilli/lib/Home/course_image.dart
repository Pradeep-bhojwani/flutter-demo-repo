import 'package:flutter/material.dart';

class course_image extends StatefulWidget {
  const course_image({super.key});

  @override
  State<course_image> createState() => _course_imageState();
}

class _course_imageState extends State<course_image> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image"),
      ),
      body: Image.asset(
          '/Users/prismetric/Desktop/Flutter_Demo_Projects/Jillii_Hybrid/jilli/assets/image/alon1.png'),
    );
  }
}
