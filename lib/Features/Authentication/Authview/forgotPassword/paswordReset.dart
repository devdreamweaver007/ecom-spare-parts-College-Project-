import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/font.dart';
import 'package:spareproject/Features/Authentication/AuthViewModel/authViewModel.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final authViewModel = Provider.of<Authviewmodel>(context, listen: false);
    authViewModel.forgotemailcontroller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<Authviewmodel>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: authColor,
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
            Text('Forgot Password ',
                style: otpFont(16, whiteColor, FontWeight.w500))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 30),
              child: Text(
                'E-Mail',
                style: authText(size.width * 0.04, whiteColor, FontWeight.w700),
              ),
            ),
            SizedBox(height: size.height * 0.0125),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextFormField(
                controller: authViewModel.forgotemailcontroller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Your E-mail';
                  }
                },
                decoration: InputDecoration(
                  label: Text(
                    'Enter Your E-mail',
                    style: authText(
                        size.width * 0.035, whiteColor, FontWeight.w300),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: whiteColor),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: whiteColor),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 64, left: 62, right: 62),
              child: Center(
                child: InkWell(
                  onTap: () {
                    authViewModel.forgotemail(
                        email: authViewModel.forgotemailcontroller.text,
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
                        'Send OTP',
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
      ),
    );
  }
}
