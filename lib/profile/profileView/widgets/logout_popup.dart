import 'package:flutter/material.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/font.dart';

logoutPopUp(BuildContext context,
    VoidCallback ontap) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Logout ",
            style: getFonts(16, buttonColor, FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
               Text("Do You Want To Logout ?",style: getFonts(14, Colors.black, FontWeight.w800),),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.width * .1,
                        width:  MediaQuery.of(context).size.width * .2,
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
                  onTap: ontap,
                  child: Container(
                    height: MediaQuery.of(context).size.width * .1,
                    width:  MediaQuery.of(context).size.width * .2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.red,
                    ),
                    child: Center(
                        child: Text(
                      "OK",
                      style: getFonts(15, whiteColor, FontWeight.bold),
                    )),
                  ),
                )
              ],
            ),
          ],
        );
      });
}