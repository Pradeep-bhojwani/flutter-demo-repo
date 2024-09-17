import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 30),
                child: Image(
                  image: AssetImage('assets/image/logo.png'),
                  fit: BoxFit.cover,
                  height: 45,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Container(
                  height: 40,
                  child: const TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      hintText: "First Name",
                      hintStyle: TextStyle(fontSize: 15),
                      fillColor: Color.fromARGB(255, 226, 227, 228),
                      filled: true,
                      border: OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Container(
                  height: 40,
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      hintText: "Last Name",
                      hintStyle: TextStyle(fontSize: 15),
                      fillColor: Color.fromARGB(255, 226, 227, 228),
                      filled: true,
                      border: OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Container(
                  height: 40,
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      hintText: "Email",
                      hintStyle: TextStyle(fontSize: 15),
                      fillColor: Color.fromARGB(255, 226, 227, 228),
                      filled: true,
                      border: OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Container(
                  height: 40,
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      hintText: "+91 india",
                      hintStyle: TextStyle(fontSize: 15),
                      fillColor: Color.fromARGB(255, 226, 227, 228),
                      filled: true,
                      border: OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Container(
                  height: 40,
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      hintText: "Phone number",
                      hintStyle: TextStyle(fontSize: 15),
                      fillColor: Color.fromARGB(255, 226, 227, 228),
                      filled: true,
                      border: OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Container(
                  height: 40,
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      hintText: "Password",
                      hintStyle: TextStyle(fontSize: 15),
                      fillColor: Color.fromARGB(255, 226, 227, 228),
                      filled: true,
                      border: OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Container(
                  height: 40,
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(fontSize: 15),
                      fillColor: Color.fromARGB(255, 226, 227, 228),
                      filled: true,
                      border: OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 30, top: 15),
                child: Center(
                  child: Container(
                    height: 30,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/image/btnOrange.png'),
                          fit: BoxFit.cover,
                        ),
                        Text(
                          "sign up",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
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
    );
  }
}
