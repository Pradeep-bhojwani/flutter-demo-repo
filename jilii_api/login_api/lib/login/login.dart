import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // For decoding JSON

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> loginUser() async {
    final String domainURL =
        "https://jillii.com/api/v6/"; // Replace with your domain URL
    final String loginURL = domainURL + "login";

    Map<String, String> params = {
      'login': emailController.text,
      'password': passwordController.text,
      'device_name': 'Flutter Device',
      'device_type': 'ios',
      'device_token': '123456', // Replace with actual device token if available
      'device_id':
          '809A5E4657B6B8F59411BB0A192ACD663503374E28DB78F974C8E80B31FA30BFDF7D048ACDA46360E56D03F8BB3C09B0E6F714367611D93C45919881D325F0BB4E6E30B52492B770C36C41839C70FE87', // Replace with your device ID
      'os_version': 'iOS Version', // Replace with actual iOS version
      'app_version': '1.0.0', // Replace with actual app version
    };

    try {
      final response = await http.post(
        Uri.parse(loginURL),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(params),
      );

      if (response.statusCode == 200) {
        // Handle successful login
        var jsonResponse = jsonDecode(response.body);
        print('Login successful: $jsonResponse');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Login Successful'),
              content: Text('Welcome back!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
        // Navigate to another screen or show a success message
      } else {
        // Handle login error
        print('Login failed: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: Container(
                    height: 50,
                    child: Image.asset(
                        '/Users/prismetric/Desktop/Flutter_Demo_Projects/jilii_api/login_api/lib/assets/LOGO@3x.png'), // Update the asset path
                  ),
                ),
              ),
              Stack(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 70),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: SizedBox(
                            height: 40,
                            child: TextField(
                              controller:
                                  emailController, // Connect to controller
                              decoration: InputDecoration(
                                hintText: 'Email',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: SizedBox(
                          height: 40,
                          child: TextField(
                            controller:
                                passwordController, // Connect to controller
                            decoration: InputDecoration(
                              hintText: 'Password',
                              border: InputBorder.none,
                            ),
                            obscureText: true, // To hide the password
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Container(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Stack(
                  children: [
                    Container(
                      width: 120,
                      height: 30,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              '/Users/prismetric/Desktop/Flutter_Demo_Projects/jilii_api/login_api/lib/assets/btn@3x.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    Positioned.fill(
                      child: TextButton(
                        onPressed: loginUser, // Call the login function
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          primary: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            'Log In',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'New to jillli?',
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            ' Sign Up',
                            style: TextStyle(
                                fontSize: 13, color: Colors.orange[800]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
