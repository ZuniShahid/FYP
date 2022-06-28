

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fypstart/Cart.dart';
import 'package:fypstart/loginscreen.dart';
import 'package:fypstart/splashScreen.dart';
import 'package:fypstart/widgets/loaderDialog.dart';

import 'firebase/DatabaseCollections.dart';

class Profile extends StatefulWidget {

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String uid = "",
      firstname = "",
      lastname = "",
      email = "",
      role = "",
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
        uidd = userData[4];
      });
      print(firstname + lastname + email + role +uidd);
    } else {
      setState(() {
        isloggedin = false;
      });
      print("Error reteriving data from current user data");
    }
  }
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  void initState() {
    super.initState();
    fetchUserInfo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*.13,
              color: Colors.black12,
              child: Center(child: Text(isloggedin == true?'Hello Welcome!\n\n  $firstname $lastname':'Login in to access full features',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),),
            ),
            SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Cart(),));
              },
              child: ListTile(
                leading: Icon(Icons.shopping_cart_outlined),
                title: Text('Cart'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {},
              child: ListTile(
                leading: Icon(Icons.favorite_border_outlined),
                title: Text('Favourities'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {

              },
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            SizedBox(height: 60),

            Padding(
              padding: const EdgeInsets.only(bottom: 18.0,left: 15,right: 15),
              child: isloggedin==true? Container(
                height: MediaQuery.of(context).size.height*.06,
                child: FlatButton(
                    color: Colors.black,
                    onPressed: () async{
                      showLoaderDialog(context);
                      await fetchUserInfo();
                        _signOut();
                        Navigator.pop(context);
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (c) => SplashScreen()),
                                (route) => false);

                    },
                    child: Center(child:
                    Text('LOGOUT',style: TextStyle(color: Colors.white),),)),
              ):Container(
                height: MediaQuery.of(context).size.height*.06,
                child: FlatButton(
                    color: Colors.black,
                    onPressed: () async{
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => LoginPage(),));

                    },
                    child: Center(child:
                    Text('LOGIN',style: TextStyle(color: Colors.white),),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
