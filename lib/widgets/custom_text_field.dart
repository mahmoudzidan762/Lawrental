import 'package:flutter/material.dart';
import 'package:lawrental/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class customTextFormField extends StatelessWidget {
  customTextFormField(
      {this.controller,
      this.validator,
      this.keyboardType,
      this.onChanged,
      this.textSize,
      this.obscureText = false,
      required this.text,
      this.borderSide = const BorderSide(),
      this.color = Colors.white,
      this.textColor = Colors.grey});

  String text;
  Color color, textColor;
  void Function(String)? onChanged;
  String? Function(String?)? validator;
  TextEditingController? controller;
  BorderSide? borderSide;
  TextInputType? keyboardType;
  bool obscureText;
  double? textSize;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: KPrimaryTextFieldColor,
        hintText: text,
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: textSize,
          fontFamily: 'medium',
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(13),
        ),
      ),
    );
  }
}
