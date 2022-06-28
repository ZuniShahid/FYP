import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fypstart/sellerView.dart';

class productSellers extends StatefulWidget {

  String productName;
  productSellers({required this.productName});
  @override
  State<productSellers> createState() => _productSellersState();
}

class _productSellersState extends State<productSellers> {
  int length =0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Sellers'),
          centerTitle: true,
          leading: IconButton(onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back))),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('ProductRegistrationDetails')
              .where('productname', isEqualTo: widget.productName)
              .where('status',isEqualTo: true)
              .where('declinestatus',isEqualTo: false)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                DocumentSnapshot data = snapshot.data!.docs[index];
                var temp = snapshot.data!.docs[index].data() as Map;
                length = snapshot.data!.docs.length;
                print('Length of Search Packages : ' + length.toString());
                return sellerCardItems(product: temp);
              },
            );
          },
        )
    ),
      ),
    );
  }
}

class sellerCardItems extends StatelessWidget {
  final Map product;
  sellerCardItems({required this.product});

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
            title: Text(product['sellername']),
            subtitle: Text('Available limit: ${product['totalslots']}'),
            trailing: Container(
              child: Column(
                children: [
                  Text('RS ${product['perslotprice']}'),
                ],
              ),
            ),
          ),
          FlatButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return sellerProfile(sellerData: product);
            },));
          }, child: Wrap(
            children: [
              Icon(Icons.shopping_cart_rounded),
              Text('View'),
            ],
          ),
          )
        ],
      )
    );
  }
}