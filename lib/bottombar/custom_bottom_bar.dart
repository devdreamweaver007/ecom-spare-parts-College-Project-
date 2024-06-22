import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Features/Cart/view/cart_screen.dart';
import 'package:spareproject/Features/Home/Home_View/homeView.dart';
import 'package:spareproject/Features/brands/view/brandsScreen.dart';
import 'package:spareproject/profile/profileView/profileView.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  List<Widget> _screens = [
    HomeView(), // Screen for index 0
    CartScreen(),// Screen for index 1
    AllBrandsScreen(),  // Screen for index 2
    Profileview() // Screen for index 3 Screen for index 4
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        items: <Widget>[
          Icon(Icons.home, size: 30,color: Colors.white,),
          Icon(Icons.shopping_cart, size: 30,color: Colors.white,),
          Icon(Icons.pix, size: 30,color: Colors.white,),
          Icon(Icons.person, size: 30,color: Colors.white,),
        ],
        color: buttonColor,
        buttonBackgroundColor: buttonColor,
        backgroundColor:whiteColor,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: _screens[_page],
    );
  }
}
