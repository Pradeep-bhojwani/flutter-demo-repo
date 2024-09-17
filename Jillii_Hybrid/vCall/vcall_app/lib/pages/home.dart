import 'package:flutter/material.dart';
import 'package:vcall_app/pages/call_page.dart';


class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('vCall'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  CallPage(
                    callID: 'u1u2',
                  ),
                ),
              );
            },
            child: Text('Call Me')),
      )),
    );
  }
}
