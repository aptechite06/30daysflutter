import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int days = 30;
    return Scaffold(
      appBar: AppBar(
        title: Text('My First App'),
      ),
      body: Center(
        child: Container(
          child: Text('Welcome to Flutter for $days Days'),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
