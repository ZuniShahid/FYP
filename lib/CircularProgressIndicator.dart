import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fypstart/createAccountScreen.dart';

class CircularProgressIndicator extends StatefulWidget {

  @override
  State<CircularProgressIndicator> createState() => _CircularProgressIndicatorState();
}

class _CircularProgressIndicatorState extends State<CircularProgressIndicator> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>createAccount()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LinearProgressIndicator(color: Colors.white,
        ),
      ),
    );
  }
}
