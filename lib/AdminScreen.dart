import 'package:flutter/material.dart';
import 'package:fypstart/MenuListDashboard.dart';
import 'package:fypstart/dashboard.dart';

class MainScreen extends StatelessWidget {
  static const String id = 'MainScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: MenuList(),
            ),
            Expanded(
              child: dashboardScreen(),
              flex: 5,
            ),
          ],
        ),
      ),
    );
  }
}

