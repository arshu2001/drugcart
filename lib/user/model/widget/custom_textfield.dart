import 'package:drugcart/user/model/widget/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Custom_TextField extends StatelessWidget{
  final TextEditingController? controller;
  final String? hintText;
  final int? maxLines;
  final FormFieldValidator<String>? validator;
  final Widget? labelText;
  final TextStyle? labelStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool? filled;
  final TextStyle? hintStyle;
  final InputBorder? border;
  final Color? fillColor;
  final InputBorder? errorBorder;
  final InputBorder? focusedBorder;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? keyboardType;


  Custom_TextField({
    super.key,
    this.controller,
    this.hintText,
    this.maxLines,
    this.validator,
    this.labelText,
    this.labelStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.hintStyle,
    this.border, 
    this.fillColor, 
    this.filled, 
    this.errorBorder, 
    this.focusedBorder,
    this.contentPadding,
    this.keyboardType,
  });
  @override 
  Widget build(BuildContext context){
    return TextFormField(
      keyboardType: keyboardType,
      validator: validator,
      maxLines: maxLines,
      controller: controller,
      obscureText: obscureText,
      
      style: GoogleFonts.poppins(
        textStyle: const TextStyle(
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
          filled: filled,
          fillColor: fillColor,
          helperStyle: hintStyle,
          label: labelText,
          prefixIcon: prefixIcon,
          errorBorder: errorBorder,
          focusedBorder: focusedBorder,
          contentPadding: contentPadding
        )
    );
  }
}