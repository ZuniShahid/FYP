import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fypstart/productSellers.dart';
import 'package:fypstart/widgets/productCard.dart';

import '../firebase/DatabaseCollections.dart';
import '../model/products.dart';

class selectProducts extends StatefulWidget {

  @override
  _selectProductsState createState() => _selectProductsState();
}

class _selectProductsState extends State<selectProducts> {


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(padding: const EdgeInsets.only(top: 60),),
                Text('Products',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 20.0),
                  child: Divider(color: Colors.grey[300],
                    thickness: 2.0,),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: productList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductsCard(title: productList[index].title, subtitle: productList[index].subtitle, imagepath: productList[index].imagepath,function: productList[index].function);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 10.0,
                    );
                  },
                )
              ],
            ),
          ),
        )
    );
  }
}


