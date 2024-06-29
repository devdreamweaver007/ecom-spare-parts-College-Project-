import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Extention/extension.dart';
import 'package:spareproject/Features/OnboardingScreen/onBoardingscreen.dart';
import 'package:spareproject/bottombar/custom_bottom_bar.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      checkLoginn();
    });
  }

  void checkLoginn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    int? id = pref.getInt('userId');
    if (token != null && id != null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNavBar(),
          ));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OnBoard(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: vailot,
      body: Container(
        child: Center(
          child: Image.asset(
            'Velo.png'.ImagePath,
            width: 57.53,
            height: 55,
          ),
        ),
      ),
    );
  }
}
