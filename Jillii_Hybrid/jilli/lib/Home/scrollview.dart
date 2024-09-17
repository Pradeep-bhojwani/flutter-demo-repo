import 'package:flutter/material.dart';

class scrollview extends StatefulWidget {
  const scrollview({super.key});

  @override
  State<scrollview> createState() => _scrollviewState();
}

class _scrollviewState extends State<scrollview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("scrollView"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          width: 300,
                          height: 300,
                          color: Colors.green,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          width: 300,
                          height: 300,
                          color: Colors.red,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          width: 300,
                          height: 300,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  height: 300,
                  color: Colors.yellow,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  height: 300,
                  color: Colors.green,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  height: 300,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ));
  }
}
