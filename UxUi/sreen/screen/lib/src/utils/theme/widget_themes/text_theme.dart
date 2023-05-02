import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  TTextTheme._(); //to avoid creating instances

  static TextTheme lightTextTheme = TextTheme(
      bodyLarge: GoogleFonts.montserrat(color: Colors.black54, fontSize: 28),
      bodyMedium: GoogleFonts.montserrat(color: Colors.black54, fontSize: 24),
      bodySmall: GoogleFonts.montserrat(color: Colors.black54, fontSize: 20));
  static TextTheme darkTextTheme = TextTheme(
      bodyLarge: GoogleFonts.montserrat(color: Colors.white70, fontSize: 28),
      bodyMedium: GoogleFonts.montserrat(color: Colors.white60, fontSize: 24),
      bodySmall: GoogleFonts.montserrat(color: Colors.white60, fontSize: 20));
}
