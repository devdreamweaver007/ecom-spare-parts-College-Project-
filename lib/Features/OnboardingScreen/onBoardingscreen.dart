import 'package:flutter/material.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/font.dart';
import 'package:spareproject/Extention/extension.dart';
import 'package:spareproject/Features/Authentication/Authview/SignIn/Login.dart';
import 'package:spareproject/Features/Authentication/Authview/SignUp/signUpView.dart';
import 'package:spareproject/bottombar/custom_bottom_bar.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
          width: mediaQuery.size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'Selection.png'.ImagePath,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * .2,
              ),
              Padding(
                padding: EdgeInsets.only(left: mediaQuery.size.width * 0.05),
                child: Text(
                  'Get started',
                  style: authText(48, whiteColor, FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: mediaQuery.size.width * 0.05),
                child: Text(
                  'Find spare parts for all bike makes and models at Velo',
                  style: authText(14, whiteColor, FontWeight.w400),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * .9,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginView(),
                            ));
                      },
                      child: Container(
                        height: mediaQuery.size.height * 0.06,
                        width: mediaQuery.size.width * 0.7,
                        decoration: BoxDecoration(
                            color: cyanColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            'LOGIN',
                            style: authText(14, Colors.black, FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpView(),
                            ));
                      },
                      child: Container(
                        height: mediaQuery.size.height * 0.06,
                        width: mediaQuery.size.width * 0.7,
                        decoration: BoxDecoration(
                            color: cyanColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            'SIGN UP',
                            style: authText(14, Colors.black, FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: mediaQuery.size.width * 0.275,
                    top: mediaQuery.size.height * 0.01),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomNavBar(),
                          ));
                    },
                    child: Text(
                      'Get Started as a Guest >>',
                      style: authText(14, whiteColor, FontWeight.w500),
                    )),
              ),
            ],
          )),
    );
  }
}
