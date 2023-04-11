import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyLarge: GoogleFonts.montserrat(color: Colors.black87),
    bodyMedium: GoogleFonts.poppins(color: Colors.deepPurple, fontSize: 24),
  );
  static TextTheme darkTextTheme = TextTheme(
    bodyLarge: GoogleFonts.montserrat(color: Colors.white70),
    bodyMedium: GoogleFonts.poppins(color: Colors.white60, fontSize: 24),
  );
}
