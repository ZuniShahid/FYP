
import 'package:flutter/material.dart';

class review{
  String buyername,description;
  int starCount;
  review({required this.buyername, required this.description,required this.starCount});
}

List<review> reviewList =[
  review(buyername: 'Zunair', description: 'Good Product', starCount: 3),
  review(buyername: 'Arham', description: 'Amazing', starCount: 5),
  review(buyername: 'Ahsan', description: 'Good Product. love the seller communication. Honest man. Looking forward to work with you', starCount: 4)
];