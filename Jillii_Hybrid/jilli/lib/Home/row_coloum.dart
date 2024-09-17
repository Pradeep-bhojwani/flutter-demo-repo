import 'package:flutter/material.dart';

class row_coloum extends StatefulWidget {
  const row_coloum({super.key});

  @override
  State<row_coloum> createState() => _row_coloumState();
}

class _row_coloumState extends State<row_coloum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('row_coloum'),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('A'),
                Text('B'),
                Text('c'),
                Text('D'),
                ElevatedButton(
                  child: Text('Checked'),
                  onPressed: () {},
                )
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('A'),
                Text('B'),
                Text('c'),
                Text('D'),
                ElevatedButton(
                  child: Text('Checked'),
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
