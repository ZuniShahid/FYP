import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:fypstart/MainPageForNavigation.dart';
import 'package:fypstart/firebase/DatabaseCollections.dart';
import 'package:fypstart/Products/selectProducts.dart';
import 'package:fypstart/widgets/loaderDialog.dart';

class buyingPostConfirmation extends StatefulWidget {
  String title,totalslots, totalPrice,perSlotPrice;
  buyingPostConfirmation({required this.title,required this.totalslots, required this.totalPrice,required this.perSlotPrice});

  @override
  _buyingPostConfirmationState createState() => _buyingPostConfirmationState();
}

class _buyingPostConfirmationState extends State<buyingPostConfirmation> {

  bool? valua = false;
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
  void initState() {
    super.initState();
    fetchUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Create a group',style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.production_quantity_limits,color: Colors.blue,size: 40),
                  SizedBox(width: 10,),
                  Container(child: Text(widget.title,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                ],
              ),
              SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Recap',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  ),
                  SizedBox(height: 5),
                  Text('- You share with ${widget.totalslots} other peoples. ',style: TextStyle(fontSize: 18),),
                  Text('- You get ${widget.perSlotPrice} per slot in a month. ',style: TextStyle(fontSize: 18),),
                  Text('- Total price of slots will be ${widget.totalPrice} per month. ',style: TextStyle(fontSize: 18),),
                  SizedBox(height: 30),
                  Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xffD3D3D3),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Expanded(child: Text('I confirm that i have read, understand\nand agree to comply to ${widget.title}\nTerms and conditions')),
                              Checkbox(
                                value: this.valua,
                                onChanged: (value) {
                                  setState(() {
                                    this.valua = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          if(valua == true){
                            await fetchUserInfo();
                            if(isloggedin == true){
                              if(role == 'premiumuser'){
                                showLoaderDialog(context);
                                print('create a collection in database collection and add product data to db');
                                print('user id:'+ uid);
                                databaseCollections db = new databaseCollections();
                                String fullname = firstname+" "+ lastname;
                                await db.registerProductDetails(uid, widget.title, fullname,phoneno,email,widget.totalslots, widget.perSlotPrice, widget.totalPrice);
                                Navigator.pop(context);
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (c) => MainMenu()),
                                        (route) => false);

                              }else{
                                final snackBar = SnackBar(
                                  content: const Text('Simple user cannot add post'),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }


                            }else{
                              print('show dialogbox to login user and move it to login screen');
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(20.0)), //this right here
                                      child: Container(
                                        height: 150,
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text('Not logged in, Login to continue.'),
                                              SizedBox(height: 20,),
                                              SizedBox(
                                                width: MediaQuery.of(context).size.width*.3,
                                                child: RaisedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pushAndRemoveUntil(
                                                        MaterialPageRoute(builder: (c) => MainMenu()),
                                                            (route) => false);
                                                  },
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(color: Colors.white),
                                                  ),
                                                  color: Colors.blue,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            }
                          }
                        },
                        child: Text('Confirm'),
                        style: ElevatedButton.styleFrom(
                          primary: valua == false? Colors.grey: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                      ),
                    ),
                  )

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
