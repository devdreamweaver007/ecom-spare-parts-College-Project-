import 'package:flutter/material.dart';
import 'package:order_tracker/order_tracker.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/font.dart';

class OrdertrackerScreen extends StatefulWidget {
  final String status;
  const OrdertrackerScreen({super.key, required this.status});

  @override
  State<OrdertrackerScreen> createState() => _OrdertrackerScreenState();
}

class _OrdertrackerScreenState extends State<OrdertrackerScreen> with TickerProviderStateMixin {
  String? statusPerfect;

  @override
  void initState() {
    super.initState();
    statusPerfect = widget.status.toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text("Track orders", style: getFonts(16, Colors.black, FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 1,
                  blurRadius: 2
                )
              ]
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30,top: 30,bottom: 30),
                child: OrderTracker(
                  headingDateTextStyle: getFonts(1, Colors.white, FontWeight.w100),
                  headingTitleStyle: getFonts(16, Colors.black, FontWeight.w600),
                  status: statusPerfect == "placed"
                      ? Status.order
                      : statusPerfect == "shipped"
                          ? Status.shipped
                          : statusPerfect == "out for delivery"
                              ? Status.outOfDelivery
                              : statusPerfect == "delivered"
                                  ? Status.delivered
                                  : Status.order,
                  activeColor: Colors.green,
                  inActiveColor: Colors.grey[300],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
