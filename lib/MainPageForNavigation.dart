import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fypstart/Cart.dart';
import 'package:fypstart/Groups/groupsMainActivity.dart';
import 'package:fypstart/Payment/paymentSelection.dart';
import 'package:fypstart/Profile.dart';
import 'package:fypstart/TopRated.dart';
import 'package:fypstart/createPost/createPostMainActivity.dart';
import 'package:fypstart/loginscreen.dart';
import 'package:fypstart/productSellers.dart';
import 'package:fypstart/Products/selectProducts.dart';
import 'package:fypstart/userSelection.dart';

class MainMenu extends StatefulWidget {
  static const String id = 'MainMenu';

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final NavigationKey = GlobalKey<CurvedNavigationBarState>();

  int index = 0;

  late var screens;
  late var bottomNavItems;
  @override
  void initState() {
    super.initState();
    screens = [
      selectProducts(),
      topRated(),
      createPost(),
      paymentSelection(),
     //Cart(),
      //LoginPage(),
      //groupMain(),
      Profile()
    ];
    bottomNavItems = [
      Icon(Icons.dashboard, size: 30),
      Icon(Icons.list_alt_rounded, size: 30),
      Icon(Icons.add, size: 30),
      Icon(Icons.shopping_cart_outlined, size: 30),
      //Icon(Icons.group, size: 30),
      Icon(Icons.more_horiz, size: 30),
      //Icon(Icons.more_horiz, size: 30)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'WE PARTNERS',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,

      ),
      body: screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: IconThemeData(color: Colors.white)),
        child: CurvedNavigationBar(
          key: NavigationKey,
          height: 60,
          color: Colors.black,
          backgroundColor: Colors.transparent,
          items: bottomNavItems,
          index: index,
          onTap: (value) {
            setState(() {
              this.index = value;
            });
          },
        ),
      ),
    );
  }
}