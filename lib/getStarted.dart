import 'package:flutter/material.dart';
import 'package:fypstart/products.dart';
import 'package:fypstart/splash_content.dart';

import 'constants.dart';



class GetStarted extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<GetStarted> {
  int currentPage=0;
  List<Map<String, String>> splashData = [
    {"text": "Find and get your desire's", "image": "assets/images/image1.jpg"},
    {"text": "Build your network on the go", "image": "assets/images/image2.jpg"},
    {
      "text": "stay ahead with curated content for your career",
      "image": "assets/images/image3.jpg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 100,
            ),

            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"].toString(),
                  text: splashData[index]['text'].toString(),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                            (index) => buildDot(index),
                      ),
                    ),
                    // Spacer(flex: 1),
                    SizedBox(
                      height: 20,
                    ),

                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(kPrimaryColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    side: BorderSide(color: kPrimaryColor)))),
                        onPressed: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => productsShow(),
                            )),
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      margin: EdgeInsets.only(right: 5),
      height: 10,
      width: currentPage == index ? 10 : 10,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.grey[800] : Colors.white,

        border: Border.all(
          color: Colors.black45,
        ),
        borderRadius: BorderRadius.circular(10), //Border.all
      ),
    );
  }
}
