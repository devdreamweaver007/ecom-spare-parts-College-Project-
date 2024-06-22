import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/flush_custom.dart';
import 'package:spareproject/Constents/font.dart';
import 'package:spareproject/Extention/extension.dart';
import 'package:spareproject/Features/Address/Viewmodel/address_view_model.dart';

class CheckoutScreen extends StatefulWidget {
  final dynamic totalPrice;
  const CheckoutScreen({super.key, this.totalPrice});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  void initState() {
    super.initState();
    final addressviewmodel =
        Provider.of<AddressViewModel>(context, listen: false);
    addressviewmodel.getAddress();
  }

  @override
  Widget build(BuildContext context) {
    final addressviewmodel = Provider.of<AddressViewModel>(context);
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text(
          "Proceed Checkout",
          style: getFonts(14, Colors.black, FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 1, spreadRadius: .5, color: Colors.grey),
                  ]),
              child: Padding(
                padding: EdgeInsets.only(top: 6, bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 14, top: 12),
                      child: Text(
                        "Details",
                        style: getFonts(14, Colors.black, FontWeight.bold),
                      ),
                    ),
                     SizedBox(
                      height: 12,
                    ),
                    dottedDiv(),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ADDRESS",
                              style: getFonts(14, blackColor, FontWeight.w700),
                            ),
                            addressviewmodel.address.isNotEmpty?
                            Text(
                              addressviewmodel.address,
                              style: getFonts(12, blackColor, FontWeight.w500),
                            ): InkWell(
                              onTap: () {
                                
                              },
                              child: Text(
                               "ADD ADDRESS NOW ->",
                                style: getFonts(15, Colors.red, FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                     SizedBox(
                      height: 12,
                    ),
                    dottedDiv(),
                     SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Amount : ",
                            style: getFonts(14, blackColor, FontWeight.w700),
                          ),
                          Text(
                            "₹ ${widget.totalPrice}",
                            style: getFonts(14, Colors.green, FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                children: [
                  Text("Payment Type : ",style: getFonts(15,Colors.black,FontWeight.w700),),
                  Spacer(),
                  Text("COD",style: getFonts(16, Colors.black, FontWeight.w700),),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.asset("cash.png".ImagePath,fit: BoxFit.cover,))
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 20,right: 20,top: 40),
            child: InkWell(
              onTap: (){
                if(addressviewmodel.address.isNotEmpty){

                }else{
                  showFlushBarCustom(context: context, color: Colors.red, message: "Please Add Address");
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color:addressviewmodel.address.isNotEmpty ? buttonColor : Colors.grey,
                ),
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 100,vertical: 15),
                child: Text("Place Order",style: getFonts(14, Colors.white, FontWeight.bold),),
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

dottedDiv() {
  return Text(
    "-----------------------------------------------------------------------------------------------------------",
    maxLines: 1,
    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700),
  );
}
