import 'package:flutter/material.dart';

class video_call extends StatefulWidget {
  const video_call({super.key});

  @override
  State<video_call> createState() => _video_callState();
}

class _video_callState extends State<video_call> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('row_coloum'),
      ),
      body: Container(
        color: Colors.amber,
      ),
    );
  }
}
