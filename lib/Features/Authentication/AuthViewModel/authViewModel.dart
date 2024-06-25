import 'package:flutter/material.dart';
import 'package:spareproject/Constents/flush_custom.dart';
import 'package:spareproject/Features/Authentication/AuthRepo/auth_repositery.dart';
import 'package:spareproject/Features/Authentication/Authview/Otp/otpVerificationView.dart';
import 'package:spareproject/Features/Authentication/Authview/SignIn/Login.dart';
import 'package:spareproject/bottombar/custom_bottom_bar.dart';
import 'package:spareproject/sharedPrefrences/sharedPreferences.dart';

class Authviewmodel extends ChangeNotifier {
  final emailcontroller = TextEditingController();
  Authrepo authrepo = Authrepo();
  Future signUp(
      {required String name,
      required String email,
      required String password,
      required String confirmpassword,
      required BuildContext context}) async {
    await authrepo
        .signUp(
      name: name,
      email: email,
      password: password,
      confirmpassword: confirmpassword,
    )
        .then(
      (value) {
        if (value?.status == true) {
          Navigator.of(context).push(MaterialPageRoute(
builder: (context) => OtpView()));
showFlushBarCustom(context: context, color: Colors.green, message: "OTP Sent Success",icon: Icons.check_circle);
        }else{
          showFlushBarCustom(context: context, color: Colors.red, message: "User With This Email Already Exist",icon: Icons.close);
        }
      },
    );
    notifyListeners();
  }

  Future otpVerify(
      {required String email,
      required String otp,
      required BuildContext context}) async {
    await authrepo.verifyOtp(email: email, otp: otp).then(
      (value) {
        if(value?.status == true){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
builder: (context) => LoginView()), (Route route)=>false);
showFlushBarCustom(context: context, color: Colors.green, message: "Verified",icon: Icons.check_circle);
        }else{
          showFlushBarCustom(context: context, color: Colors.red, message: "OTP Is Inncorrect",icon: Icons.close);
        }
      },
    );
    notifyListeners();
  }

   logIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    await authrepo.logIn(email: email, password: password).then(
      (value) {
        if (value?.status == true) {
        storeToken(value?.token ?? "");
        storeUserId(value?.id ?? 0);
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
builder: (context) => BottomNavBar()), (Route route) => false);
        }else{
          showFlushBarCustom(context: context, color: Colors.red, message: "user not found",icon: Icons.close);
        }
      },
    );
    notifyListeners();
  }
}
