import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/flush_custom.dart';
import 'package:spareproject/Constents/font.dart';
import 'package:spareproject/Features/Authentication/AuthViewModel/authViewModel.dart';

class ForgotOtpView extends StatefulWidget {
  const ForgotOtpView({
    super.key,
  });

  @override
  State<ForgotOtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<ForgotOtpView> {
  String otp = "";
  TextEditingController otpController = TextEditingController();
  Timer? _timer;
  int _start = 30; // Initial countdown time in seconds
  bool _isButtonDisabled = false;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _isButtonDisabled = true;
      _start = _start + 30; // Increment the countdown time by 30 seconds
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_start <= 0) {
          timer.cancel();
          _isButtonDisabled = false;
        } else {
          _start--;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<Authviewmodel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: authColor,
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: whiteColor,
                )),
            Text('OTP Verification Code',
                style: otpFont(16, whiteColor, FontWeight.w300))
          ],
        ),
      ),
      backgroundColor: authColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Enter the 4-digit OTP',
                      style: otpFont(18, whiteColor, FontWeight.w300)),
                  Text(authViewModel.forgotemailcontroller.text,
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
                          _start != 0 ? 'Resend OTP in $_start' : "",
                          style: authText(14, whiteColor, FontWeight.w500),
                        ),
                        TextButton(
                          onPressed: _isButtonDisabled
                              ? null
                              : () {
                                  _startTimer();
                                },
                          child: Text(
                            ' Resend OTP',
                            style: authText(
                                14,
                                _isButtonDisabled ? Colors.grey : Colors.blue,
                                FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 64, left: 62, right: 62),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          otp.length != 4
                              ? showFlushBarCustom(
                                  context: context,
                                  color: Colors.red,
                                  message: "Please Fill The OTP",
                                  icon: Icons.close)
                              : authViewModel.forgototp(
                                  otp: otp,
                                  email:
                                      authViewModel.forgotemailcontroller.text,
                                  context: context);
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
                              'Verify OTP',
                              style: authText(
                                MediaQuery.of(context).size.width * 0.035,
                                whiteColor,
                                FontWeight.w600,
                              ),
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
