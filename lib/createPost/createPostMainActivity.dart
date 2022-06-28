

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fypstart/createPost/buyingPost.dart';

class createPost extends StatefulWidget {

  @override
  _createPostState createState() => _createPostState();
}

class _createPostState extends State<createPost> {
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
            Text('Add Product',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 20.0),
              child: Divider(color: Colors.grey[300],
                thickness: 2.0,),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text('Create a '),
                // Text('Custom Group',style: TextStyle(color: Colors.blue),),
                // Text(' OR'),
              ],
            ),
            SizedBox(height: 15),
            Expanded(child:
            ListView(
            children:
            [
              Row(children: [
                Icon(Icons.video_call,color: Colors.blue,size: 40,),
                Text(' TV Streaming',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
              ],),
          GridView.count(crossAxisCount: 3,
            physics: ScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              serviceCard(title: 'Amazon', color: Colors.blue, imagePath: 'assets/images/amazonprimevideo.png' ),
              serviceCard(title: 'Netflix', color: Colors.black87, imagePath: 'assets/images/netFlix.png' ),
              serviceCard(title: 'Disney +', color: Colors.blue, imagePath: 'assets/images/disney.png' ),
              serviceCard(title: 'Youtube Premium', color: Colors.white70, imagePath: 'assets/images/youtube.png' ),

              ],
          ),
              SizedBox(height: 15),
              Row(children: [
                Icon(Icons.music_note_outlined,color: Colors.blue,size: 40,),
                Text(' Music',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
              ],),
              GridView.count(crossAxisCount: 3,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  serviceCard(title: 'Apple Music', color: Colors.black, imagePath: 'assets/images/applemusic.png' ),
                  serviceCard(title: 'Youtube Music', color: Colors.black87, imagePath: 'assets/images/youtube.png' ),
                  serviceCard(title: 'Spotify', color: Colors.grey, imagePath: 'assets/images/spotify.png' ),
                  serviceCard(title: 'Google Music', color: Colors.grey, imagePath: 'assets/images/googleplaymusic.png' ),
                ],
              ),
              SizedBox(height: 15),
              Row(children: [
                Icon(Icons.keyboard,color: Colors.blue,size: 40,),
                Text(' Gaming',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
              ],),
              GridView.count(crossAxisCount: 3,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  serviceCard(title: 'Steam', color: Colors.blue, imagePath: 'assets/images/steam.png' ),
                  serviceCard(title: 'XBOX', color: Colors.black87, imagePath: 'assets/images/xbox.png' ),
                ],
              ),
              SizedBox(height: 15),
              Row(children: [
                Icon(Icons.storage_outlined,color: Colors.blue,size: 40,),
                Text(' Storage',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
              ],),
              GridView.count(crossAxisCount: 3,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  serviceCard(title: 'Dropbox', color: Colors.white, imagePath: 'assets/images/dropbox.png' ),
                ],
              ),
              SizedBox(height: 15),
              Row(children: [
                Icon(Icons.production_quantity_limits,color: Colors.blue,size: 40,),
                Text(' Productivity',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
              ],),
              GridView.count(crossAxisCount: 3,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  serviceCard(title: 'Office 365', color: Colors.blue, imagePath: 'assets/images/office365.png' ),
                ],
              ),
            ],))

          ],
        ),),
      ));
  }
}

class serviceCard extends StatelessWidget {
  String title;
  Color color;
  String imagePath;
  serviceCard({required this.title, required this.color,required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return buyingPost(title: title);
        },));
      },
      child: Card(
        color: color,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(flex: 3,child: Center(child: Image.asset(imagePath))),
              Expanded(flex: 1,child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Center(child: Text(title,style: TextStyle(fontWeight: FontWeight.bold),))))
            ],
          ),
        )
        // Stack(
        //   children: <Widget>[
        //     Center(
        //       child: Image.asset(imagePath),
        //     ),
        //     Container(
        //       margin: EdgeInsets.only(top: 90,left:20),
        //       child: Text(title,style: TextStyle(color: Colors.white,fontSize: 22.0,fontWeight: FontWeight.bold)),
        //     )
        //   ],
        // ),
      ),
    );
  }
}
