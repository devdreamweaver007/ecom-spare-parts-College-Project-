import 'package:flutter/material.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/font.dart';
import 'package:spareproject/Constents/textfield.dart';
import 'package:spareproject/Extention/extension.dart';

class DeliveryAdressView extends StatefulWidget {
  const DeliveryAdressView({super.key});

  @override
  State<DeliveryAdressView> createState() => _DeliveryAdressViewState();
}

TextEditingController fullNameController = TextEditingController();
TextEditingController mobileController = TextEditingController();
TextEditingController adrressController = TextEditingController();
TextEditingController pincontroller = TextEditingController();
TextEditingController statecontroller = TextEditingController();
TextEditingController cityController = TextEditingController();
TextEditingController locationController = TextEditingController();

class _DeliveryAdressViewState extends State<DeliveryAdressView> {
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
                    'Continue',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  maxRadius: 8,
                  child: Image.asset(
                    'tick.png'.ImagePath,
                    height: 10,
                    width: 15,
                  ),
                ),
                Image.asset(
                  'LinePurple.png'.ImagePath,
                  width: 100,
                ),
                CircleAvatar(
                  backgroundColor: buttonColor,
                  child: Text(
                    '2',
                    style: authText(10, whiteColor, FontWeight.w500),
                  ),
                  maxRadius: 8,
                ),
                Image.asset(
                  'LineGrey.png'.ImagePath,
                  width: 100,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    '3',
                    style: authText(10, Colors.black45, FontWeight.w500),
                  ),
                  maxRadius: 8,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  adressNameTextField(fullNameController, 'Full Name', 335, 40),
                  adressNameTextField(
                      mobileController, 'Mobile number', 335, 40),
                  Container(
                    width: 335,
                    child: TextField(
                      decoration: InputDecoration(
                        label: Text(
                          'Address',
                          style: authText(14, Colors.grey, FontWeight.w400),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 40.0, horizontal: 12.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        adressNameTextField(pincontroller, 'Pin Code', 158, 40),
                        adressNameTextField(statecontroller, 'State', 158, 40),
                      ],
                    ),
                  ),
                  adressNameTextField(cityController, 'City', 158, 40),
                  adressNameTextField(locationController,
                      'Road Line, Area name,House Number', 335, 40),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: whiteColor, boxShadow: [
                BoxShadow(blurRadius: 1, spreadRadius: 1, color: Colors.grey)
              ]),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price detials',
                      style: authText(20, blackColor, FontWeight.w600),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Price :',
                          style: authText(16, blackColor, FontWeight.w400),
                        ),
                        Text(
                          '3,999',
                          style: authText(16, blackColor, FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Number Of Item :',
                          style: authText(16, blackColor, FontWeight.w400),
                        ),
                        Text(
                          '2',
                          style: authText(16, blackColor, FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery Charge :',
                          style: authText(16, blackColor, FontWeight.w400),
                        ),
                        Text(
                          '40',
                          style: authText(16, blackColor, FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 0.5,
                      color: blackColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Amount :',
                          style: authText(16, blackColor, FontWeight.w400),
                        ),
                        Text(
                          '4039',
                          style: authText(16, blackColor, FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
