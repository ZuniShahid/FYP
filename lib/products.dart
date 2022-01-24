import 'package:flutter/material.dart';
import 'package:fypstart/productSellers.dart';

class productsShow extends StatefulWidget {
  const productsShow({Key? key}) : super(key: key);

  @override
  _productsShowState createState() => _productsShowState();
}

class _productsShowState extends State<productsShow> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('We Partners'),
    ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
      Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
      ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: AssetImage('assets/images/netFlix.png'),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => productSellers()));
        },
      ),
              height: 180,
              fit: BoxFit.cover,
      ),
            Text(
              'Netflix',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Ink.image(
                    image: AssetImage( 'assets/images/amazonprimevideo.png'),
                    child: InkWell(
                      onTap: () {},
                    ),
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    'Amazon Prime Video',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Ink.image(
                    image: AssetImage( 'assets/images/google.png'),
                    child: InkWell(
                      onTap: () {},
                    ),
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    'Google',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Ink.image(
                    image: AssetImage( 'assets/images/office365.png'),
                    child: InkWell(
                      onTap: () {},
                    ),
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    'Office 365',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Ink.image(
                    image: AssetImage( 'assets/images/spotify.png'),
                    child: InkWell(
                      onTap: () {},
                    ),
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    'Spotify',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Ink.image(
                    image: AssetImage( 'assets/images/youtube.png'),
                    child: InkWell(
                      onTap: () {},
                    ),
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    'YouTube',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Ink.image(
                    image: AssetImage( 'assets/images/googleplaymusic.png'),
                    child: InkWell(
                      onTap: () {},
                    ),
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    'Google Play Music',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
