import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/font.dart';
import 'package:spareproject/Features/Authentication/AuthViewModel/authViewModel.dart';
import 'package:spareproject/Features/Authentication/Authview/SignIn/Login.dart';

class OtpView extends StatefulWidget {
  const OtpView({
    super.key,
  });

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  String otp = "";
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<Authviewmodel>(context);
    return Scaffold(
      backgroundColor: authColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 42, left: 18),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: whiteColor,
                      )),
                  Text('OTP Verification Code',
                      style: otpFont(16, whiteColor, FontWeight.w300))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32, top: 85),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Enter the 4-digit OTP sent to',
                      style: otpFont(18, whiteColor, FontWeight.w300)),
                  Text(authViewModel.emailcontroller.text,
                      style: otpFont(18, whiteColor, FontWeight.w300)),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 54),
                    child: OTPTextField(
                      onChanged: (value) {
                        otp = value;
                      },
                      length: 4,
                      width: MediaQuery.of(context).size.width * 0.8,
                      fieldWidth: 45,
                      style: TextStyle(fontSize: 17),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.box,
                      spaceBetween: 40,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28, left: 5),
                    child: Row(
                      children: [
                        Text(
                          'Already have an account?',
                          style: authText(14, whiteColor, FontWeight.w500),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginView(),
                                ));
                          },
                          child: Text(
                            ' Resend?',
                            style: authText(14, Colors.blue, FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Text(
                          '00:49',
                          style: authText(14, whiteColor, FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 64,left: 62,right: 62),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          authViewModel.otpVerify(
                              context: context,
                              email: authViewModel.emailcontroller.text,
                              otp: otp);
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.056,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: buttonColor,
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * 0.03),
                          ),
                          child: Center(
                            child: Text(
                              'Send OTP',
                              style: authText(
                                  MediaQuery.of(context).size.width * 0.035,
                                  whiteColor,
                                  FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
