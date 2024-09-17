import 'package:flutter/material.dart';

class challenge extends StatefulWidget {
  const challenge({super.key});

  @override
  State<challenge> createState() => _challengeState();
}

class _challengeState extends State<challenge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 60,
            color: Colors.blue,
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Testing Sample",
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ),
                  Row(
                    children: [
                      Image(
                        image: AssetImage('assets/image/heart.png'),
                        fit: BoxFit.cover,
                        height: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Favorites",
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w700,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.brown),
                  ),
                  title: Text('item 75'),
                  trailing: Image(
                    image: AssetImage('assets/image/heart.png'),
                    fit: BoxFit.cover,
                    height: 25,
                  ),
                );
              },
              itemCount: 30,
              itemExtent: 50,
            ),
          )),
        ],
      )),
    );
  }
}
