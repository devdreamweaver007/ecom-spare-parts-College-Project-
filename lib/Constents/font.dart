import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getFonts(double fontsize, Color color, FontWeight fontweight) {
  return GoogleFonts.poppins(
      fontWeight: fontweight, fontSize: fontsize, color: color);
}

TextStyle splashfont(double fontsize, Color color, FontWeight fontweight) {
  return GoogleFonts.audiowide(
      fontWeight: fontweight, fontSize: fontsize, color: color);
}

TextStyle authText(double fontsize, Color color, FontWeight fontweight) {
  return GoogleFonts.roboto(
      fontWeight: fontweight, fontSize: fontsize, color: color);
}

TextStyle otpFont(double fontsize, Color color, FontWeight fontweight) {
  return GoogleFonts.lexend(
      fontWeight: fontweight, fontSize: fontsize, color: color);
}

TextStyle segmentFont(double fontsize, FontWeight fontweight) {
  return GoogleFonts.poppins(
      fontWeight: fontweight, fontSize: fontsize,);
}
