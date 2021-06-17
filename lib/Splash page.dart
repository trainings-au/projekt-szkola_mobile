import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projekt_szkola/main.dart';

class Splashpage extends StatefulWidget {
  Splashpage({Key key}) : super(key: key);

  @override
  _SplashpageState createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PageOne(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Color.fromARGB(7, 5, 5, 1),
            child: Center(
              child: SizedBox(
                width: 70,
                height: 70,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.black26,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Color.fromARGB(140, 1, 1, 1)),
                  strokeWidth: 8,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
