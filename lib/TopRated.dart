import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fypstart/userSelection.dart';

class topRated extends StatefulWidget {

  @override
  State<topRated> createState() => _topRatedState();
}

class _topRatedState extends State<topRated> {
  List<Map<String, String>> sellersData=[];
  @override
  void initState() {
    sellersData = [
      {"title": "Zunair", "price":"150","persons":"9","rating":"1"},
      {"title": "Ahsan","price":"180","persons":"4","rating":"2"},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: const EdgeInsets.only(top: 60),),
            Text('Top Rated Sellers',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 20.0),
              child: Divider(color: Colors.grey[300],
                thickness: 2.0,),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: sellersData.length,
              itemBuilder: (context, index) {
                return Container(
                  child: sellerCardItems(title: sellersData[index]['title'].toString(),
                    price: sellersData[index]['price'].toString(),
                    persons: sellersData[index]['persons'].toString(),
                    rating: sellersData[index]['rating'].toString(),
                  ),
                );
              },
            ),
          ],
        ),
    ),
      ),
    );
  }
}

class sellerCardItems extends StatelessWidget {
  String title,price,persons,rating;
  sellerCardItems({required this.title, required this.price, required this.persons, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(title),
              subtitle: Text('Available limit: $persons'),
              leading: Text('#$rating'),
              trailing: Container(
                child: Column(
                  children: [
                    Text('RS $price'),
                  ],
                ),
              ),
            ),
            FlatButton(onPressed: () {
              final snackBar = SnackBar(
                content: const Text('Added to Cart'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }, child: Wrap(
              children: [
                Icon(Icons.shopping_cart_rounded),
                Text('Buy'),
              ],
            ))
          ],
        )
    );
  }
}
