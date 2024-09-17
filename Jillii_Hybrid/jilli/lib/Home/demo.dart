import 'package:flutter/material.dart';
import 'package:jilli/Home/home_screen.dart';

class demo extends StatefulWidget {
  const demo({super.key});

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'SUP,JOHN.',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      fontFamily: 'Arial'),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Did you had a good day today?',
                  style: TextStyle(
                      fontSize: 11,
                      color: Colors.white54,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      fontFamily: 'Arial'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 20),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 30, 30, 30)),
                  height: 180,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 40),
                        width: 140,
                        child: Image(
                          image: AssetImage('assets/image/medical.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Text(
                                    'FEELING',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none,
                                        fontFamily: 'Arial'),
                                  ),
                                ),
                                Text(
                                  'ALONE?',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none,
                                      fontFamily: 'Arial'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Come chat with me',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.none,
                                        fontFamily: 'Arial'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 25),
                                  child: Container(
                                    height: 35,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors
                                          .white, // Adjust the radius here
                                    ),
                                    child: Center(
                                      child: Text('CHAT',
                                          style:
                                              TextStyle(color: Colors.black)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, right: 20),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 30, 30, 30)),
                  height: 90,
                  child: Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(right: 90),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'START YOUR JOURNEY',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Arial'),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 25),
                              child: Text(
                                'Sourdscape * 3-10 min',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'Arial'),
                              ),
                            ),
                          ],
                        ),
                      )),
                      Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: Image(
                          width: 40,
                          image: AssetImage('assets/image/play.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Recommended for you',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white60,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        fontFamily: 'Arial'),
                  ),
                ),
              ),
              Container(
                height: 190,
                child: GridView.builder(
                  scrollDirection:
                      Axis.horizontal, // Set scroll direction to horizontal
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, // One row for horizontal scrolling
                  ),
                  itemBuilder: (_, index) => Container(
                    // Specify a width for horizontal items
                    margin: EdgeInsets.only(top: 10, right: 20),
                    // color: Colors.white, // Add margin for spacing

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 30, 30, 30),
                          ),
                          child: Center(
                            // Center the image within the container
                            child: SizedBox(
                              width: 80,
                              height: 80,
                              child: Image(
                                image: AssetImage('assets/image/medical.png'),
                                fit: BoxFit
                                    .contain, // Keep the image contained within the specified size
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'SLEEP AMBIENT',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              decoration: TextDecoration.none,
                              fontFamily: 'Arial'),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Sourdscape * 3-10 min',
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                              fontFamily: 'Arial'),
                        ),
                      ],
                    ),
                  ),
                  itemCount: 10,
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 110,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.lock),
              label: 'Lockout',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Stats',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          // currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          // onTap: _onItemTapped,
          backgroundColor: Color.fromARGB(255, 30, 30, 30),
          unselectedItemColor: Color.fromARGB(255, 100, 100, 100),
        ),
      ),
    );
  }
}
