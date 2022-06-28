import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:fypstart/createPost/buyingPostConfirmation.dart';
import 'package:fypstart/firebase/DatabaseCollections.dart';

  class buyingPost extends StatefulWidget {
  String title;
  buyingPost({required this.title});

  @override
  _buyingPostState createState() => _buyingPostState();
  }

  class _buyingPostState extends State<buyingPost> {

  int increment =1;
  TextEditingController _pricecontroller = new TextEditingController();

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

  incrementSlot(){
  setState(() {
  increment+=1;
  });
  }

  decrementSlot(){
    setState(() {
      increment-=1;
    });
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
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Select number of slots',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 48.0),
                      child: OutlinedButton(
                        onPressed: () {
                          if(increment != 0)
                            {
                              decrementSlot();
                            }else{
                            print('value already 0');
                          }
                        },
                        child: Text('-',style: increment == 0? TextStyle(fontSize: 25,color: Colors.grey): TextStyle(fontSize: 25,color: Colors.blue)),
                        style: OutlinedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(24),
                        ),
                      ),
                    ),
                    Expanded(child: Center(child: Text('${increment.toString()}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)))),
                    Padding(
                      padding: const EdgeInsets.only(right: 48.0),
                      child: OutlinedButton(
                        onPressed: () {
                          incrementSlot();
                        },
                        child: Text('+',style: TextStyle(fontSize: 25),),
                        style: OutlinedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(24),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: Text('Select per slot price',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                    Expanded(child: TextFormField(
                      controller: _pricecontroller,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'eg. RS 12',
                        hintText: 'eg. RS 12',
                      ),
                    ), ),

              ],
              ),
                SizedBox(height: 40),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if(increment !=0){
                          if(_pricecontroller.text.isNotEmpty) {
                            if(isloggedin == true) {
                              if (role == 'premiumuser') {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) {
                                  return buyingPostConfirmation(title: widget.title,
                                      totalslots: increment.toString(),
                                      totalPrice: (increment *
                                          int.parse(_pricecontroller.text))
                                          .toString(),
                                      perSlotPrice: _pricecontroller.text);
                                },));
                              } else if( role == 'simpleuser'){
                                final snackBar = SnackBar(
                                  content: const Text('Simple user cannot add post'),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              } else{
                                final snackBar = SnackBar(
                                  content: const Text('User must be loggedin first'),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            } else{
                              final snackBar = SnackBar(
                                content: const Text('User must be loggedin first'),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }

                          }
                        }

                      },
                      child: increment ==0?
                      Text('Add slots',style: TextStyle(fontSize: 20),):
                      _pricecontroller.text.isEmpty?
                      Text('Empty Field',style: TextStyle(fontSize: 20),):
                      role == 'premiumuser'?
                      Text('Continue',style: TextStyle(fontSize: 20),):
                      Text('Not a premium user',style: TextStyle(fontSize: 20),),

                      style: ElevatedButton.styleFrom(
                        primary: increment ==0? Colors.grey:_pricecontroller.text.isEmpty?Colors.grey:role == 'premiumuser'?Colors.blue: Colors.grey,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                      ),
                    ),
                  ),
                )

          ],
              ),
              SizedBox(height: 200),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xffD3D3D3),
                    border: Border.all(
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text('Note',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    Container(width: MediaQuery.of(context).size.width*.5,child: Divider(thickness: 1,)),
                    SizedBox(height: 10),
                    Text('You must be a VIP user to create a post.')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
