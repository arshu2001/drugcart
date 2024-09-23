import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight? weight;
  final Color? color;
  final double? letterSpacing;
  final TextDecoration? decoration;
   CustomText({
    required this.text,
    required this.size,
    this.weight,
    this.color,
    this.letterSpacing,
    this.decoration,
    super.key
   });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: size,
          fontWeight: weight,
          color: color,
          letterSpacing: letterSpacing,
          decoration: decoration
          
        )
      ),
      
    );
  }
}