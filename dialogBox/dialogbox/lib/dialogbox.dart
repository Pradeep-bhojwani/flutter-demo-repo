import 'package:flutter/material.dart';

class dialogbox extends StatefulWidget {
  const dialogbox({super.key});

  @override
  State<dialogbox> createState() => _dialogboxState();
}

class _dialogboxState extends State<dialogbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints
                .expand(), // Ensure the container fills the entire screen
            child: Image.asset(
              '/Users/prismetric/Desktop/Flutter_Demo_Projects/dialogBox/dialogbox/lib/asset/pexels-eberhardgross-1624496.jpg', // Use relative path in assets
              fit: BoxFit.cover, // Make the image cover the container
            ),
          ),
          Positioned(
            top: 100, // Adjust as needed
            right: 150, // Adjust as needed
            child: ElevatedButton(
              onPressed: () {
                // Define your button action here
                _showMyDialog(context);
              },
              child: Text('Hit me!!'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // Set to false if you want to prevent dismissal by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Update the time',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  color: Colors.black, // Change color as needed
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          content: Text(
              'This is thThis is the content of the dialog.This is the content of the dialog.This is the content of the dialog.This is the content of the dialog.This is the content of the dialog.This is the content of the dialog.This is the content of the dialog.This is the content of the dialog.This is the content of the dialog.This is the content of the dialog.This is the content of the dialog.e content of the dialog.'),
          actions: <Widget>[
            Container(
              width: 500,
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200, // Set the height of the bottom sheet
                        color: Colors.white,
                        child: Center(
                          child: Text(' Task Completed with Bottom Sheet '),
                        ),
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow, // Set the background color to yellow
                ),
                child: Text('Save changes'),
              ),
            ),
          ],
        );
      },
    );
  }
}
