import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Custom_TextField extends StatelessWidget{
  final TextEditingController? controller;
  final String? hintText;

  Custom_TextField({
    super.key,
    this.controller,
    this.hintText,
  });
  @override 
  Widget build(BuildContext context){
    return TextFormField(
      controller: controller,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w400
          
        ),
      ),
        decoration : InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          hintText: hintText,
        )
    );
  }
}