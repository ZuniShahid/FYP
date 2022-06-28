import 'package:flutter/material.dart';


class SplashContent extends StatelessWidget {

  final String text;
  final String image;


  SplashContent({required this.text,required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),


        Image.asset(
          image,
          height: 300,
          width: 255,
        ),


        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),

        Spacer(flex: 1),

      ],
    );
  }
}
