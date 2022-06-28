import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fypstart/userSelection.dart';
import 'package:fypstart/widgets/loaderDialog.dart';

import 'MainPageForNavigation.dart';
import 'createAccountScreen.dart';
import 'firebase/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;


class  LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailFieldController= TextEditingController();
  TextEditingController passwordFieldController= TextEditingController();
  bool passwordFieldVisibility = false;
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Container(
              width:  MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Login',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20.0),
                    child: Divider(color: Colors.grey[300],
                      thickness: 2.0,),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
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
                          height: 10,
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
                                      "LOGIN".toUpperCase(),
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
                              onPressed: () async{
                                String email = emailFieldController.text,
                                    password = passwordFieldController.text;
                                try {
                                  if(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
                                    if (password.length > 7) {
                                      showLoaderDialog(context);
                                      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                          email: emailFieldController.text,
                                          password: passwordFieldController.text
                                      );
                                      //Navigator.push(context, MaterialPageRoute(builder: (context) => MainMenu()));
                                      Navigator.pop(context);
                                      final snackBar = SnackBar(
                                        content: const Text('Successfully Login'),
                                      );
                                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(builder: (c) => MainMenu()),
                                              (route) => false);
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
                                }on FirebaseAuthException catch (e) {
                                  if (e.code == 'user-not-found') {
                                    print('No user found for that email.');
                                  } else if (e.code == 'wrong-password') {
                                    print('Wrong password provided for that user.');
                                  }
                                }
                              }
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don\'t have an account?'),
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => userSelection()));
                              },
                              child: Text(
                                ' Create an account',
                                style: TextStyle(color: Colors.blue),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Divider(
                                  color: Colors.grey[300],
                                  thickness: 2.0,
                                )
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text("OR"),
                            ),
                            Expanded(
                                child: Divider(
                                  color: Colors.grey[300],
                                  thickness: 2.0,
                                )
                            ),
                          ]
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      children: [
                        SignInButton(
                          Buttons.Google,
                          text: "Login with Google",
                          onPressed: () {},
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SignInButton(
                          Buttons.Facebook,
                          text: "Login with Facebook",
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
