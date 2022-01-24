import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(child: Image.asset(
              'assets/images/logo.png',),
            ),
            SizedBox(
              height: 50,
            ),
            listTile(title: 'Dashboard', image: "assets/images/ds.png", press: (){},
            ),
            SizedBox(
              height: 15,
            ),
            listTile(title: 'Dashboard', image: "assets/images/ds.png", press: (){},
            ),
            SizedBox(
              height: 15,
            ),
            listTile(title: 'Dashboard', image: "assets/images/ds.png", press: (){},
            ),
            SizedBox(
              height: 15,
            ),
            listTile(title: 'Dashboard', image: "assets/images/ds.png", press: (){},
            ),
          ],
        ),
      ),
    );
  }
}

class listTile extends StatelessWidget {
  const listTile({
    Key? key,
    required this.title,
    required this.image,
    required this.press,
  }) : super(key: key);

  final String title, image;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: Image.asset(
        image,
        color: Colors.grey,
        width: 60,
        height: 100,
      ),
      title: Text(title,
          style: TextStyle(
              color: Colors.black87
          )),
    );
  }
}