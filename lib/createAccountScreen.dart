import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fypstart/MainPageForNavigation.dart';
import 'package:fypstart/firebase/DatabaseCollections.dart';
import 'package:fypstart/widgets/loaderDialog.dart';
import 'firebase/authentication.dart';
import 'loginscreen.dart';

class createAccount extends StatefulWidget {
  static const String id = 'createAccount';
  String usertype;
  createAccount({required this.usertype});
  @override
  State<createAccount> createState() => _createAccountState();
}

class _createAccountState extends State<createAccount> {
  TextEditingController firstNameFieldController= TextEditingController();
  TextEditingController secondNameFieldController= TextEditingController();
  TextEditingController emailFieldController= TextEditingController();
  TextEditingController phoneFieldController= TextEditingController();
  TextEditingController passwordFieldController= TextEditingController();
  bool passwordFieldVisibility = false;
  var authHandler = new Auth();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    passwordFieldVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              width:  MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sign Up',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Divider(color: Colors.grey[300],
                      thickness: 2.0,),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Align(
                          child: TextFormField(
                            controller: firstNameFieldController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: 'First Name',
                              filled: true,
                              prefixIcon: Icon(
                                Icons.person,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                          child: TextFormField(
                            controller: secondNameFieldController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: 'Last Name',
                              filled: true,
                              prefixIcon: Icon(
                                Icons.person,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                          child: TextFormField(
                            controller: emailFieldController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: 'Enter Email',
                              filled: true,
                              prefixIcon: Icon(
                                Icons.email,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 15,
                        ),
                        Align(
                          child: TextFormField(
                            controller: phoneFieldController,
                            maxLength: 11,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: 'Enter Phone number',
                              filled: true,
                              prefixIcon: Icon(
                                Icons.phone,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0.11),
                          child: TextFormField(
                            controller: passwordFieldController,
                            obscureText: !passwordFieldVisibility,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: 'Enter Password',
                              filled: true,
                              prefixIcon: Icon(
                                Icons.lock,
                              ),
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                      () => passwordFieldVisibility = !passwordFieldVisibility,
                                ),
                                child: Icon(
                                  passwordFieldVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Color(0xFF757575),
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.4,
                          child: ElevatedButton(
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.login),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                      "SignUp".toUpperCase(),
                                      style: TextStyle(fontSize: 18)
                                  )
                                ],),
                              style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                          side: BorderSide(color: Colors.black)
                                      )
                                  )
                              ),
                              onPressed: () async {
                                String fname = firstNameFieldController.text,lname=secondNameFieldController.text,email = emailFieldController.text,
                                    password = passwordFieldController.text;
                                UserCredential userCredential;
                                try {
                                  if(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
                                    if (password.length > 7) {
                                      if(phoneFieldController.text.length == 11){
                                        showLoaderDialog(context);
                                        userCredential =
                                        await FirebaseAuth.instance
                                            .createUserWithEmailAndPassword(
                                            email: emailFieldController.text,
                                            password: passwordFieldController.text
                                        );
                                        var user = FirebaseAuth.instance
                                            .currentUser;
                                        if(widget.usertype == 'premiumuser'){
                                          databaseCollections()
                                              .registerPremiumUser(
                                              fname, lname, email, phoneFieldController.text, user!.uid)
                                              .then((value) async {
                                            final snackBar = SnackBar(
                                              content: const Text(
                                                  'Successfully Login'),
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                            Navigator.pop(context);
                                            Navigator.push(context,
                                                new MaterialPageRoute(
                                                    builder: (context) =>
                                                        MainMenu()));
                                          });
                                        } else {
                                          databaseCollections()
                                              .registerSimpleUser(
                                              fname, lname, email, phoneFieldController.text,user!.uid)
                                              .then((value) async {
                                            final snackBar = SnackBar(
                                              content: const Text(
                                                  'Successfully Login'),
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                            Navigator.pop(context);
                                            Navigator.push(context,
                                                new MaterialPageRoute(
                                                    builder: (context) =>
                                                        MainMenu()));
                                          });
                                        }
                                      }
                                      else{
                                        final snackBar = SnackBar(
                                          content: const Text('Phone number must be 11 characters'),
                                        );
                                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                      }

                                    }
                                    else {
                                      final snackBar = SnackBar(
                                        content: const Text('Password must be 8 characters'),
                                      );
                                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                    }
                                  }
                                  else {
                                    final snackBar = SnackBar(
                                      content: const Text('Invalid Email'),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  }

                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'weak-password') {
                                    print('The password provided is too weak.');
                                  } else if (e.code == 'email-already-in-use') {
                                    print('The account already exists for that email.');
                                  }
                                } catch (e) {
                                  print(e);
                                }
                              }
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                ],
              ),
            ),
          ),
      ]
        ),
      ),
    );
  }
}
