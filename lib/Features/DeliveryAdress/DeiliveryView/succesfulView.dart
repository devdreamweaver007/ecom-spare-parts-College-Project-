import 'package:flutter/material.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/font.dart';
import 'package:spareproject/Extention/extension.dart';

class SuccesFulview extends StatefulWidget {
  const SuccesFulview({super.key});

  @override
  State<SuccesFulview> createState() => _SuccesFulviewState();
}

class _SuccesFulviewState extends State<SuccesFulview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(99, 110, 220, 1),
      body: Container(
        child: Column(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
            Padding(
              padding: const EdgeInsets.only(left: 150, top: 140, right: 150),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(56),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5, spreadRadius: 5, color: whiteColor)
                    ]),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(56)),
                  child: Image.asset(
                    'PaymentTick.png'.ImagePath,
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                children: [
                  Text(
                    'Payment Succesfull!',
                    style: authText(32, whiteColor, FontWeight.w600),
                  ),
                  Text(
                    'Wroom! You have Completed Your Payment',
                    style: authText(16, whiteColor, FontWeight.w500),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    'Amount of Product',
                    style: authText(14, whiteColor, FontWeight.w500),
                  ),
                  Text(
                    'RS.4030',
                    style: authText(24, whiteColor, FontWeight.w500),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Container(
                    height: 40,
                    width: 335,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(33)),
                    child: Center(
                      child: Text(
                        'Rate Your Experience',
                        style: authText(17, blackColor, FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40,
                    width: 335,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(33)),
                    child: Center(
                      child: Text(
                        'Continue Purchase',
                        style: authText(17, blackColor, FontWeight.w500),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
