import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  // DM Sans styles
  TextStyle dmSansBody({Color? color = Colors.white, double? fontSize}) =>
      GoogleFonts.dmSans(
        textStyle: TextStyle(
          color: color,
          fontSize: fontSize ?? 12, // Ubah ukuran font menjadi 12
          fontWeight: FontWeight.w400,
        ),
      );

  TextStyle dmSansHeading({Color? color = Colors.white, double? fontSize}) =>
      GoogleFonts.dmSans(
        textStyle: TextStyle(
          color: color,
          fontSize: fontSize ?? 18, // Ubah ukuran font menjadi 18
          fontWeight: FontWeight.bold,
        ),
      );

  TextStyle dmSansTitle({Color? color = Colors.white, double? fontSize}) =>
      GoogleFonts.dmSans(
        textStyle: TextStyle(
          color: color,
          fontSize: fontSize ?? 16, // Ubah ukuran font menjadi 16
          fontWeight: FontWeight.w600,
        ),
      );

  TextStyle dmSansSubtitle({Color? color = Colors.white}) => GoogleFonts.dmSans(
        textStyle: TextStyle(
          color: color,
          fontSize: 14, // Ubah ukuran font menjadi 14
          fontWeight: FontWeight.w500,
        ),
      );

  TextStyle dmSansDescription({Color? color = Colors.white}) =>
      GoogleFonts.dmSans(
        textStyle: TextStyle(
          color: color,
          fontSize: 10, // Ubah ukuran font menjadi 10
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.italic,
        ),
      );

  // Inter styles
  TextStyle interBody({Color? color = Colors.white}) => GoogleFonts.inter(
        textStyle: TextStyle(
          color: color,
          fontSize: 12, // Ubah ukuran font menjadi 12
          fontWeight: FontWeight.w400,
        ),
      );

  TextStyle interHeading({Color? color = Colors.white}) => GoogleFonts.inter(
        textStyle: TextStyle(
          color: color,
          fontSize: 18, // Ubah ukuran font menjadi 18
          fontWeight: FontWeight.bold,
        ),
      );

  TextStyle interTitle({Color? color = Colors.white, double? fontSize}) =>
      GoogleFonts.inter(
        textStyle: TextStyle(
          color: color,
          fontSize: fontSize ?? 16, // Ubah ukuran font menjadi 16
          fontWeight: FontWeight.w600,
        ),
      );

  TextStyle interSubtitle({Color? color = Colors.white}) => GoogleFonts.inter(
        textStyle: TextStyle(
          color: color,
          fontSize: 14, // Ubah ukuran font menjadi 14
          fontWeight: FontWeight.w500,
        ),
      );

  TextStyle interDescription({Color? color = Colors.white}) =>
      GoogleFonts.inter(
        textStyle: TextStyle(
          color: color,
          fontSize: 10, // Ubah ukuran font menjadi 10
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.italic,
        ),
      );
}
