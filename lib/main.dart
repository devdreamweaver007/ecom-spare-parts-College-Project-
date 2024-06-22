import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:spareproject/Features/Authentication/AuthViewModel/authViewModel.dart';
import 'package:spareproject/Features/Cart/ViewModel/cart_view_model.dart';
import 'package:spareproject/Features/Home/HomeviewModel/home_view_model.dart';
import 'package:spareproject/Features/SplashScreen/SplashscreenView.dart';
import 'package:spareproject/Features/brands/view_model/brand_view_model.dart';
import 'package:spareproject/profile/profileView/profileView.dart';
import 'package:spareproject/profile/profileViewModel/proViewModel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProVieModel(),
        ),
        ChangeNotifierProvider(create: (context) => Authviewmodel()),
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
        ChangeNotifierProvider(create: (context) => BrandViewModel()),
        ChangeNotifierProvider(create: (context) => CartViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
      builder: EasyLoading.init(),
    );
  }
}
