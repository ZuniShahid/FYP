import 'package:flutter/material.dart';

class productSellers extends StatefulWidget {

  @override
  State<productSellers> createState() => _productSellersState();
}

class _productSellersState extends State<productSellers> {
  List<Map<String, String>> sellersData=[];
  @override
  void initState() {
    sellersData = [
      {"title": "Zunair", "price":"150","persons":"9"},
      {"title": "Ahsan","price":"180","persons":"4"},
      {"title": "Yousaf","price":"130","persons":"3"},
      {"title": "saad","price":"160","persons":"1"},
      {"title": "Babar","price":"155","persons":"3"},
      {"title": "Tariz", "price":"150","persons":"9"},
      {"title": "Shabrez","price":"180","persons":"4"},
      {"title": "Muzamil","price":"130","persons":"3"},
      {"title": "Arham","price":"160","persons":"1"},
      {"title": "Ali","price":"155","persons":"3"},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(appBar: AppBar(title: Text('Sellers'),),body: ListView.builder(

      itemCount: sellersData.length,
      itemBuilder: (context, index) {
        return Container(
          child: sellerCardItems(title: sellersData[index]['title'].toString(),
              price: sellersData[index]['price'].toString(),
              persons: sellersData[index]['persons'].toString(),
             ),
        );
    },
    ),
    ),
    );
  }
}

class sellerCardItems extends StatelessWidget {
  String title,price,persons;
  sellerCardItems({required this.title, required this.price, required this.persons});

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
            trailing: Container(
              child: Column(
                children: [
                  Text('\$ $price'),
                ],
              ),
            ),
          ),
          FlatButton(onPressed: () {

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