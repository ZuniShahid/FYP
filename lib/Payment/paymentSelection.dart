import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class paymentSelection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.orange[200],borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0)),
                    )
                    ,child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text('Payment Methods',style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(fontSize: 30,color: Colors.black)
                            ),
                              //TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            // Text('Save Money',style: GoogleFonts.lato(fontSize: 17,fontStyle: FontStyle.italic),
                            // ),
                            // Text('Save Time',style: GoogleFonts.lato(fontSize: 17,fontStyle: FontStyle.italic),
                            // ),

                          ],
                        ),
                      )

                    ],
                  ),
                )
                )
                ,flex: 1,),

              Expanded(
                flex: 2,
                child: Center(
                  child: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: InkWell(
                              onTap: (){
                                //Navigator.push(context, MaterialPageRoute(builder: (context) => createAccount(usertype: 'premiumuser',)));
                              },
                              child: Card(
                                  elevation: 20,
                                  color: Colors.greenAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 30,),
                                      Image.asset(
                                        'assets/images/easypaisaa.png',
                                        fit: BoxFit.fill,height: 100,
                                      ),
                                      SizedBox(height: 10,),
                                      Text('EasyPaisa',style: GoogleFonts.lato(fontSize: 17,fontStyle: FontStyle.italic),
                                      ),

                                    ],
                                  )
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: InkWell(
                              onTap: (){
                                //Navigator.push(context, MaterialPageRoute(builder: (context) => createAccount(usertype: 'simpleuser',)));
                              },
                              child: Card(
                                  elevation: 20,
                                  color: Colors.grey[300],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 30,),
                                      Image.asset(
                                        'assets/images/stripe.png',
                                        fit: BoxFit.fill,height: 100,
                                      ),
                                      Text('Stripe',style: GoogleFonts.lato(fontSize: 17,fontStyle: FontStyle.italic),
                                      ),

                                    ],
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
