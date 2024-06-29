import 'package:flutter/material.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/font.dart';
import 'package:spareproject/Features/Authentication/Authview/SignIn/Login.dart';

notLoginPopup(
  BuildContext context,
) {
  final size = MediaQuery.of(context).size;
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          "To Get More Details Login ",
          style: getFonts(16, Colors.black, FontWeight.w700),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 70,
                width: 70,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      height: 30,
                      width: size.width / 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: buttonColor,
                      ),
                      child: Center(
                          child: Text(
                        "Cancel",
                        style: getFonts(15, whiteColor, FontWeight.bold),
                      )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginView(),
                          ));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      height: 30,
                      width: size.width / 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: buttonColor,
                      ),
                      child: Center(
                          child: Text(
                        "Login",
                        style: getFonts(15, whiteColor, FontWeight.bold),
                      )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
