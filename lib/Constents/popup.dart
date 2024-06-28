import 'package:flutter/material.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/font.dart';
import 'package:spareproject/Features/Authentication/Authview/SignIn/Login.dart';

notLoginPopup(
  BuildContext context,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          "Please Login ! ",
          style: getFonts(17, Colors.red, FontWeight.w700),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Text("To Continue Purchasing You Must need to Login",style: getFonts(15, Colors.black, FontWeight.w600),),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.red,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: Text(
                                                "Cancel",
                                                style: getFonts(15, whiteColor, FontWeight.bold),
                                              ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
builder: (context) => LoginView()), (Route route)=>false);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: buttonColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: Text(
                                                "Login",
                                                style: getFonts(15, whiteColor, FontWeight.bold),
                                              ),
                      ),
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
