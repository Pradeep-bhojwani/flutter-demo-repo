import 'package:flutter/material.dart';
import 'package:jilli/Home/home_screen.dart';

class profile_screen extends StatefulWidget {
  const profile_screen({super.key});

  @override
  State<profile_screen> createState() => _profile_screenState();
}

class _profile_screenState extends State<profile_screen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    IconButton(
                      icon: Image(
                        image: AssetImage('assets/image/back.png'),
                        fit: BoxFit.cover,
                        height: 20,
                      ),
                      iconSize: 50,
                      onPressed: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      },
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "my profile",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.orange,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Image(
                      image: AssetImage('assets/image/chat.png'),
                      fit: BoxFit.cover,
                      height: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image(
                      image: AssetImage('assets/image/settings.png'),
                      fit: BoxFit.cover,
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 150,
              child: Column(
                children: [
                  Container(
                      height: 90,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Container(
                                decoration: BoxDecoration(
                                  // color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.orange, // Border color
                                    width: 3.0,
                                    // Border width
                                  ),
                                ),
                                child: Image.asset("assets/image/profile.png"),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      // color: Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.orange, // Border color
                                        width: 3.0,
                                        // Border width
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "15",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              decoration: TextDecoration.none,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "Events",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.grey,
                                              decoration: TextDecoration.none,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      // color: Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.orange, // Border color
                                        width: 3.0,
                                        // Border width
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "0",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              decoration: TextDecoration.none,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "Posts",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.grey,
                                              decoration: TextDecoration.none,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      // color: Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.orange, // Border color
                                        width: 3.0,
                                        // Border width
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "1",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              decoration: TextDecoration.none,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "Contacts",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.grey,
                                              decoration: TextDecoration.none,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                  Container(
                    height: 50,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    // color: Colors.amberAccent,
                    child: Row(
                      children: [
                        Container(
                          width: 90,
                          // color: Colors.black,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text('Pradeep bhojwani',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                      decoration: TextDecoration.none,
                                    )),
                                SizedBox(height: 4),
                                Text('edit profile',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 9,
                                      color: Colors.orange,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.none,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            // color: Colors.red,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 10,
                                  height: 30,
                                  top: 10,
                                  width: 120,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Button 1 action
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary:
                                          Colors.orange, // Background color
                                      onPrimary: Colors.white, // Text color
                                    ),
                                    child: Text(
                                      'create post',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  top: 10,
                                  height: 30,
                                  width: 120,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Button 2 action
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary:
                                          Colors.orange, // Background color
                                      onPrimary: Colors.white, // Text color
                                    ),
                                    child: Text(
                                      'create event',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 0.1,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 1, // Spread radius
                    blurRadius: 1, // Blur radius
                    offset: Offset(0, 3), // Shadow position
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Image.asset("assets/image/grid.png"),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  // border: Border.all(color: Colors.red),
                ),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Number of columns
                    crossAxisSpacing: 2, // Space between columns
                    mainAxisSpacing: 2, // Space between rows
                  ),
                  itemCount: 15, // Number of items in the grid
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        // borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        "assets/image/wallpaper.jpg",
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
