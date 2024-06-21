import 'package:flutter/material.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/font.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: whiteColor, boxShadow: [
          BoxShadow(blurRadius: 1, color: Colors.grey, spreadRadius: 1)
        ]),
        child: BottomAppBar(
          color: whiteColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '3,999',
                style: authText(24, blackColor, FontWeight.w700),
              ),
              Container(
                decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(12)),
                width: 137,
                height: 40,
                child: Center(
                  child: Text(
                    'Confirm Order',
                    style: otpFont(14, whiteColor, FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: whiteColor,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: whiteColor, boxShadow: [
                BoxShadow(blurRadius: 1, spreadRadius: 1, color: Colors.grey)
              ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deliver to :',
                      style: authText(20, blackColor, FontWeight.w600),
                    ),
                    Text(
                      'KrishnaKanth',
                      style: authText(16, blackColor, FontWeight.w400),
                    ),
                    Text(
                      'Nalakath House Tirur Malapuram',
                      style: authText(16, blackColor, FontWeight.w400),
                    ),
                    Text(
                      'Girls High scool Road',
                      style: authText(16, blackColor, FontWeight.w400),
                    ),
                    Text(
                      'Tirur Malapuram',
                      style: authText(16, blackColor, FontWeight.w400),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, top: 20),
              child: Container(
                height: 42,
                width: 334,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(220, 223, 247, 1),
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 5,
                          blurRadius: 5,
                          color: Color.fromRGBO(220, 223, 247, 1))
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Amount :',
                      style: authText(18, vailot, FontWeight.w400),
                    ),
                    Text(
                      '4003 RS',
                      style: authText(18, vailot, FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'Payment Method',
                style: authText(16, blackColor, FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Container(
                height: 28,
                width: 150,
                decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 1, spreadRadius: 1, color: Colors.grey)
                    ]),
                child: Center(
                  child: Text(
                    'Cash On Delivery',
                    style: authText(18, whiteColor, FontWeight.w800),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
