import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showFlushBarCustom({
  required BuildContext context,
  required Color color,
  required String message,
  IconData? icon, // Add an optional icon parameter
}) {
  Flushbar(
    padding: EdgeInsets.all(20),
    positionOffset: 50,
    margin: EdgeInsets.only(left: 16, right: 16),
    borderRadius: BorderRadius.circular(16),
    backgroundColor: color,
    message: message,
    duration: Duration(seconds: 3),
    icon: icon != null
        ? Icon(
            icon,
            color: Colors.white,
          )
        : null,
  )..show(context);
}
