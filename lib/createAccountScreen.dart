import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class createAccount extends StatefulWidget {
  static const String id = 'createAccount';
  @override
  State<createAccount> createState() => _createAccountState();
}

class _createAccountState extends State<createAccount> {
  TextEditingController firstNameFieldController= TextEditingController();
  TextEditingController secondNameFieldController= TextEditingController();
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
            padding: const EdgeInsets.only(top: 90),
            child: Container(
              width:  MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.80,
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
                    padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 18.0),
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
                              onPressed: () => null
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account?'),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                ' Login',
                                style: TextStyle(color: Colors.blue),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                    height: 40,
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
