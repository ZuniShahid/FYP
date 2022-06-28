import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fypstart/widgets/loaderDialog.dart';
import 'package:url_launcher/url_launcher.dart';

import 'MainPageForNavigation.dart';
import 'firebase/DatabaseCollections.dart';
import 'model/cart.dart';

class sellerProfile extends StatefulWidget {

  final Map sellerData;
  sellerProfile({required this.sellerData});

  @override
  _sellerProfileState createState() => _sellerProfileState();
}

class _sellerProfileState extends State<sellerProfile> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String uid = "",
      firstname = "",
      lastname = "",
      email = "",
      role = "",
      phoneno = "",
      uidd = "";
  bool isloggedin= false;


  fetchUserInfo() async {
    final User user = await _auth.currentUser!;
    uid = user.uid;
    dynamic userData = await databaseCollections().getCurrentUserData(uid);
    if (userData != null) {
      setState(() {
        isloggedin = true;
        firstname = userData[0];
        lastname = userData[1];
        email = userData[2];
        role = userData[3];
        phoneno = userData[4];
        uidd = userData[5];
      });
      print(firstname + lastname + email + role +uidd);
    } else {
      setState(() {
        isloggedin = false;
      });
      print("Error reteriving data from current user data");
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        },
            icon: Icon(Icons.arrow_back,color: Colors.white,)),
        title: Text('Seller Info'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.message))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height*.6,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height:10),
                        Center(child: Text(widget.sellerData['productname'].toString().toUpperCase(), style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),)),
                        SizedBox(height:40),
                        Container(
                          decoration: new BoxDecoration(
                              color: Color(0xffD7E5F0),
                              borderRadius: new BorderRadius.all(Radius.circular(10))
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('  Monthly',style: TextStyle(fontSize: 20),),
                                    Text('Free Slots',style: TextStyle(fontSize: 20),)
                                  ],
                                ),),
                              Container(
                                height:50,
                                width: MediaQuery.of(context).size.width,

                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('RS${widget.sellerData['perslotprice']}',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                                    Text('${widget.sellerData['freeslots']} / ${widget.sellerData['totalslots']}',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
                                  ],
                                ),)
                            ],
                          ),
                        ),
                        SizedBox(height:30),
                        Text('SELLER INFO',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        SizedBox(height:10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Name: ',style: TextStyle(fontSize: 17)),
                              Text(widget.sellerData['sellername'],style: TextStyle(fontSize: 17)),
                            ],
                          ),
                        ),
                        SizedBox(height:10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Email: ',style: TextStyle(fontSize: 17)),
                              Text(widget.sellerData['selleremail'],style: TextStyle(fontSize: 17)),
                            ],
                          ),
                        ),
                        SizedBox(height:30),
                        Text('REVIEWS',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ],
                ),),
            ),
            Column(
              children: [
                FlatButton(
                    color: Colors.green,
                    onPressed: () async{
                      print(widget.sellerData['sellerphonenumber']);
                      whatsappMessage(
                          number:
                          widget.sellerData['sellerphonenumber'],
                          message:
                          'Hello sir, I want to know about your product ${widget.sellerData['productname']}');
                      // Navigator.push(context, MaterialPageRoute(
                      //     builder: (context) { return Text('page push here');}));

                    },
                    child: ListTile(
                      leading: Icon(Icons.message,color: Colors.white,),
                      title: Center(child: Padding(
                        padding: const EdgeInsets.only(right: 40.0),
                        child: Text('CHAT',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      )),
                    )),
                SizedBox(height: 10,),
                FlatButton(
                    color: Colors.black,
                    onPressed: () async{
                      showLoaderDialog(context);
                      await fetchUserInfo();

                        if(isloggedin == true) {


                          if(email != widget.sellerData['selleremail']){
                            if(int.parse(widget.sellerData['freeslots']) > 0){

                              var cartData = {
                                'buyername': firstname+ " "+ lastname,
                                'buyerphonenumber': phoneno,
                                'buyeremail': email,
                                'sellerphonenumber': widget.sellerData['sellerphonenumber'],
                                'selleremail': widget.sellerData['selleremail'],
                                'sellername': widget.sellerData['sellername'],
                                'productname': widget.sellerData['productname'],
                                'totalslots': widget.sellerData['totalslots'],
                                'priceperslot': widget.sellerData['perslotprice'],
                                'freeslots': widget.sellerData['freeslots'],
                              };
                              databaseCollections db = new databaseCollections();
                              await db.addToCart(cartData);
                              Navigator.pop(context);
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (c) => MainMenu()),
                                      (route) => false);

                            }else{
                              Navigator.pop(context);
                              final snackBar = SnackBar(
                                content: const Text('Slots Not Available'),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                          }else {
                            Navigator.pop(context);
                            final snackBar = SnackBar(
                              content: const Text('Seller cannot be buyer'),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }


                        }else{
                          Navigator.pop(context);
                          final snackBar = SnackBar(
                            content: const Text('Login first to get access'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }





                    },
                    child: ListTile(
                      leading: Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                      title: Center(child: Padding(
                        padding: const EdgeInsets.only(right: 40.0),
                        child: Text('ADD TO CART',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      )),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

void whatsappMessage({required number, required message}) async{
  String url = "http://wa.me/+92${number}?text=${message}";
  try{
    await  launch(url);
  }catch(e)
  {
    print(e.toString());
  }
}