
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.fieldLabel, required this.hint, required this.controller,  this.suffixIcon,  this.obscureText, this.validator});
  final String fieldLabel,hint;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String? Function(String?)? validator;


  @override
  Widget build(BuildContext context) {
    return   TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,

      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
      ),

    );
  }
}
