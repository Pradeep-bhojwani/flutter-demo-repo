import 'package:flutter/material.dart';

class music_screen extends StatefulWidget {
  const music_screen({super.key});

  @override
  State<music_screen> createState() => _music_screenState();
}

class _music_screenState extends State<music_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.grey,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: 180,
            child: Center(
              // Center the image within the container
              child: SizedBox(
                width: 130,
                child: Image(
                  image: AssetImage('assets/image/medical.png'),
                  fit: BoxFit
                      .contain, // Keep the image contained within the specified size
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 50, 50, 50),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      height: 250,
                      child: Column(
                        children: [
                          Text(
                            'SLEEP AMBIENT',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                decoration: TextDecoration.none,
                                fontFamily: 'Arial'),
                          ),
                          Text(
                            'Landscape',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w100,
                                decoration: TextDecoration.none,
                                fontFamily: 'Arial'),
                          ),
                          Text(
                            'Lets stop according and get last in one of these',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                                fontFamily: 'Arial'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
