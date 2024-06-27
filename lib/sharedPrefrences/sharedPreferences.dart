import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spareproject/Constents/flush_custom.dart';
import 'package:spareproject/Constents/popup.dart';
import 'package:spareproject/Features/Authentication/Authview/SignIn/Login.dart';

Future storeToken(String token) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString('token', token);
}

Future storeUserId(int userId) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setInt('userId', userId);
}

Future removeToken({required BuildContext context}) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.remove('token');
  pref.remove('userId');
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginView()),
      (Route route) => false);
}

Future getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? token = pref.getString('token');
  return token != null;
}

Future checkIdandToken(BuildContext context) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? token = pref.getString('token');
  int? id = pref.getInt('userId');
  if (token == null && id == null) {
    notLoginPopup(context);
  }
}
