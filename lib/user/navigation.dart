import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthify/user/chat/chat.dart';
import 'package:healthify/user/home_page/doctor_detail.dart';
import 'package:healthify/user/myOrders/myorders.dart';
import 'package:healthify/user/pharmacy/medDetails.dart';
import 'package:healthify/user/pharmacy/meds.dart';
import 'package:healthify/user/notifications/notifications.dart';

import 'donor/donor.dart';
import 'home_page/home_screen.dart';

class Navigation extends StatefulWidget {
   const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _navigation();
}

class _navigation extends State<Navigation> {
  final navigationKey=GlobalKey<CurvedNavigationBarState>();
  int index=2;
  final screens=[
    Notifications(),
    Medicines(),
    HomeScreen(),
    Donor(),
    Chat(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        key: navigationKey,
        index: index,
        height: 55,
        buttonBackgroundColor: Colors.blue.shade600,
        backgroundColor: Colors.transparent,
        color: Colors.blue.shade600,
        animationCurve: Curves.bounceInOut,
        animationDuration: Duration(milliseconds: 300),
        items: <Widget>[
          Icon(Icons.notifications, size: 20,color: Colors.white,),
          Icon(Icons.add_shopping_cart, size: 20,color: Colors.white,),
          Icon(Icons.home, size: 20,color: Colors.white),
          Icon(Icons.water_drop, size: 20,color: Colors.white),
          Icon(Icons.chat, size: 20,color: Colors.white),
        ],
        onTap: (index)=>setState(()=>this.index=index),
      ),
    );
  }
}