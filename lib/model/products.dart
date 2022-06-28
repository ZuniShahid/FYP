
import 'package:flutter/material.dart';

class products{
  String title,subtitle, imagepath;
  Function function;

  products({required this.title, required this.subtitle, required this.imagepath,required this.function});
}

List<products> productList =[
  products(title: 'Netflix', subtitle: 'This is netflix subtitle', imagepath: 'assets/images/netFlix.png',function: (){}),
  products(title: 'Amazon', subtitle: 'This is Amazon prime subtitle', imagepath: 'assets/images/amazonprimevideo.png',function: (){}),
  products(title: 'Office 365', subtitle: 'This is office 365 subtitle', imagepath: 'assets/images/office365.png',function: (){}),
  products(title: 'Spotify', subtitle: 'This is spotify subtitle', imagepath: 'assets/images/spotify.png',function: (){}),
  products(title: 'Apple Music', subtitle: 'This is Apple Music subtitle', imagepath: 'assets/images/ds.png',function: (){}),
  products(title: 'Disney +', subtitle: 'This is Disney subtitle', imagepath: 'assets/images/ds.png',function: (){}),
  products(title: 'Dropbox', subtitle: 'This is Dropbox subtitle', imagepath: 'assets/images/ds.png',function: (){}),
  products(title: 'Youtube', subtitle: 'This is youtube subtitle', imagepath: 'assets/images/youtube.png',function: (){}),
  products(title: 'Google Music', subtitle: 'This is Google play music subtitle', imagepath: 'assets/images/googleplaymusic.png',function: (){}),
];