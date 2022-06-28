

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class groupMain extends StatefulWidget {

  @override
  _groupMainState createState() => _groupMainState();
}

class _groupMainState extends State<groupMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(child:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: const EdgeInsets.only(top: 60),),
            Text('Groups',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 20.0),
              child: Divider(color: Colors.grey[300],
                thickness: 2.0,),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Pending', style: TextStyle( fontSize: 18)),
                    style: ElevatedButton.styleFrom(primary: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Joined', style: TextStyle( fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Created', style: TextStyle( fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),),
      ),
    );
  }
}
