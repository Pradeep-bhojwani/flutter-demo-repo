import 'package:flutter/material.dart';
import 'package:jilli/Home/home_screen.dart';
import 'package:jilli/login/signup.dart';
// ignore: depend_on_referenced_packages
// import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo
            const Padding(
              padding: EdgeInsets.only(bottom: 40.0),
              child: Text(
                'jillii',
                style: TextStyle(color: Colors.red, fontSize: 50),
              ),
            ),
            // Email TextField
            TextField(
              decoration: InputDecoration(
                hintText: 'abc@yopmail.com',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Password TextField
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: '••••••••',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Implement forgot password functionality
                },
                child: Text(
                  'Forgot password?',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 24.0),
            // Login Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orangeAccent,
                padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
              onPressed: () {
                // Implement login functionality
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  HomeScreen()));
              },
              child: Text('log in'),
            ),
            SizedBox(height: 24.0),
            // Sign Up link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('New to jillii?'),
                TextButton(
                  onPressed: () {
                    // Implement sign up functionality
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Signup()));
                  },
                  child:
                      Text('Sign Up', style: TextStyle(color: Colors.orange)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
