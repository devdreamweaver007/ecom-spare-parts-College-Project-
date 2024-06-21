import 'package:flutter/material.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/font.dart';
import 'package:spareproject/Features/Home/Home_View/search_products.dart';

Widget searchFieldContainer(
    TextEditingController? controller, String label, Widget? prefixicon,BuildContext context) {
  return Container(
    height: 45,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: whiteColor,
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 1, spreadRadius: 1)
        ]),
    child: TextField(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
      },
      readOnly: true,
      controller: controller,
      decoration: InputDecoration(
        hintText: 'search Products',
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        prefixIcon: prefixicon,
      ),
    ),
  );
}

Widget adressNameTextField(
  TextEditingController? controller,
  String label,
  double? width,
  double? height,
) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Container(
      height: height,
      width: width,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            label: Text(
              label,
              style: authText(
                  16, Color.fromRGBO(217, 217, 217, 1), FontWeight.w400),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
      ),
    ),
  );
}
