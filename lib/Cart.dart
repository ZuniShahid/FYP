import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fypstart/Products/selectProducts.dart';
import 'package:fypstart/widgets/loaderDialog.dart';

import 'MainPageForNavigation.dart';

class Cart extends StatefulWidget {

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  int count=0;
  int total=0;int lengthofdocs=0;
  Future incrementcounter(int value)async{
    setState(() {
      count = value;
    });
  }

  Future getTotal()async{
    late Map cartdata;
    await FirebaseFirestore.instance.collection('cart').get().then((QuerySnapshot querySnapshot)
    {
      lengthofdocs = querySnapshot.docs.length;
      querySnapshot.docs.forEach((element) {
        cartdata = element.data() as Map;
      });
    });
    int toadd=0;
    for(int i=0;i<lengthofdocs;i++){
      int perslotprice = int.parse(cartdata['priceperslot']);
      toadd+=perslotprice;
    }
    setState(() {
      total = toadd;
    });
  }


  @override
  void initState() {
    getTotal();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.black),
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
          title: Text(
            'Cart',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
          ),
          centerTitle: true,

        ),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text('ITEMS(${count.toString()})'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text('TOTAL: ${total.toString()}'),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20.0),
                  child: Divider(color: Colors.grey[300],
                    thickness: 2.0,),
                ),
                Container(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('cart')
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
                          var cartData = snapshot.data!.docs[index].data() as Map;
                          var cartDataid= snapshot.data!.docs[index].id;

                          //TODO: taking more space and running constantly.. find another method to get count
                          var length = snapshot.data!.docs.length;

                          Future.delayed(Duration.zero, () async {
                            incrementcounter(length);

                          });

                          return ListTile(
                            trailing: Wrap(
                              spacing: 12,
                              children: [
                                Image.asset(cartData['productname']=='Netflix'?'assets/images/netFlix.png':cartData['productname']=='Amazon'?'assets/images/amazonprimevideo.png':'assets/images/ds.png',width: 50,height: 50,),
                                IconButton(onPressed: () async{
                                  showLoaderDialog(context);
                                  await FirebaseFirestore.instance.collection('cart').doc(cartDataid).delete();
                                  await getTotal();
                                  Navigator.pop(context);
                                }, icon: Icon(Icons.delete,color: Colors.red,))
                              ],
                            ),
                            title: Text(cartData['productname']),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(cartData['sellerphonenumber']),
                                Text('RS ${cartData['priceperslot']}',style: TextStyle(fontWeight: FontWeight.w700)),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20.0),
                  child: Divider(color: Colors.grey[300],
                    thickness: 2.0,),
                ),
                GestureDetector(
                  onTap: () { Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (c) => MainMenu()),
                          (route) => false);},
                  child: ListTile(
                    leading: Icon(Icons.favorite,color: Colors.redAccent),
                    title: Text('Add more products'),
                    trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20.0),
                  child: Divider(color: Colors.grey[300],
                    thickness: 2.0,),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*.9,
                  height: 150,
                  decoration: BoxDecoration(border: Border.all(color: Colors.black45)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Orders Details',style: TextStyle(fontWeight: FontWeight.bold),),
                      Divider(color: Colors.grey[300],
                        thickness: 2.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text('Cart Total'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text('RS  ${total.toString()}'),
                        )
                      ],),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text('Discount'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text('Rs 0.00'),
                        )
                      ],),
                      Divider(color: Colors.grey[300], thickness: 2.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text('Total Payable',style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text('RS  ${total.toString()}',style: TextStyle(fontWeight: FontWeight.bold),),
                        )
                      ],),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 18.0,left: 15,right: 15),
          child: Container(
            height: MediaQuery.of(context).size.height*.06,
            child: FlatButton(
                color: Colors.black,
                onPressed: () {

                }, child: Center(child: Text('PLACE ORDER',style: TextStyle(color: Colors.white),),)),
          ),
        ),
      ),
    );
  }
}
