import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyleTextModel {
  static Text items(
      {required String text,
      required double size,
      Color? color,
      var fontWeight}) {
    return Text(
      text,
      style: GoogleFonts.inter(
          fontSize: size, fontWeight: fontWeight, color: color),
    );
  }
}
