import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fypstart/createAccountScreen.dart';
import 'package:fypstart/products.dart';
import 'package:google_fonts/google_fonts.dart';


class selectionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: Colors.black,))
      ),
      body: SafeArea(

        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0)),
                    )
                    ,child: Column(
                  children: [
                    // Align(
                    //                     //   alignment: Alignment.bottomLeft,
                    //                     //   child: Image.asset(
                    //                     //     'assets/images/vipuserlogo.png',
                    //                     //     width: 100,
                    //                     //     height: 150,),
                    //                     // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('BE PARTNERS',style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(fontSize: 30,color: Colors.black)
                          ),
                          //TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Save Money',style: GoogleFonts.lato(fontSize: 17,fontStyle: FontStyle.italic),
                          ),
                          Text('Save Time',style: GoogleFonts.lato(fontSize: 17,fontStyle: FontStyle.italic),
                          ),

                        ],
                      ),
                    )

                  ],
                )
                )
                ,flex: 1,),

              Expanded(
                flex: 2,
                child: Center(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => productsShow()));
                              },
                              child: Card(
                                elevation: 20,
                                color: Colors.grey[500],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Column(
                                  children: [
                                    Image.asset(
                                          'assets/images/vipuserlogo.png',
                                        fit: BoxFit.fill,
                                          ),
                                    Text('Premium Account',style: GoogleFonts.lato(fontSize: 17,fontStyle: FontStyle.italic),
                                    ),

                                  ],
                                )
                            ),
                          ),
                        ),
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => createAccount()));
                            },
                            child: Card(
                                elevation: 20,
                                color: Colors.amber[300],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/simpleuserlogo.png',
                                      fit: BoxFit.fill,
                                    ),
                                    Text('Simple User',style: GoogleFonts.lato(fontSize: 17,fontStyle: FontStyle.italic),
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
            ],
          ),
        )
        ),
    );
  }
}