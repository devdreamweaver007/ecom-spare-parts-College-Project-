import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/font.dart';
import 'package:spareproject/Features/Authentication/AuthViewModel/authViewModel.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ChangePasswordView> {
  TextEditingController confirmController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<Authviewmodel>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: authColor,
      appBar: AppBar(
        backgroundColor: authColor,
        title: Center(
            child: Text(
          'New Password',
          style: authText(16, whiteColor, FontWeight.bold),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 30),
              child: Text(
                'New Password',
                style: authText(size.width * 0.04, whiteColor, FontWeight.w700),
              ),
            ),
            SizedBox(height: size.height * 0.0125),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextFormField(
                controller: newpasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Your Password';
                  }
                },
                decoration: InputDecoration(
                  label: Text(
                    'Enter Your New Pasword',
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
              padding: const EdgeInsets.only(left: 15, top: 30),
              child: Text(
                'Confirm New Password',
                style: authText(size.width * 0.04, whiteColor, FontWeight.w700),
              ),
            ),
            SizedBox(height: size.height * 0.0125),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextFormField(
                controller: confirmController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm Your Password';
                  }
                },
                decoration: InputDecoration(
                  label: Text(
                    'Confirm Your New Pasword',
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
              padding: const EdgeInsets.only(top: 60, left: 62, right: 62),
              child: Center(
                child: InkWell(
                  onTap: () {
                    authViewModel.changePaswword(
                        email: authViewModel.forgotemailcontroller.text,
                        newPassword: newpasswordController.text,
                        confirmNewPassword: confirmController.text,
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
                        'Submit',
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
