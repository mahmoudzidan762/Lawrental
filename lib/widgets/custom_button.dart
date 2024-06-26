import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      this.onTap,
      required this.text,
      this.fontSize = 18,
      required this.textColor,
      required this.color,
      required this.height,
      required this.width});
  final String? text;
  final VoidCallback? onTap;
  final Color? color;
  final Color? textColor;
  final double height;
  final double width;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF14213D)),
            borderRadius: BorderRadius.circular(13),
            color: color,
          ),
          height: height,
          width: width,
          child: Center(
              child: Text(
            text!,
            style: TextStyle(
              color: textColor,
              fontFamily: 'medium',
              fontSize: 18.sp,
            ),
          )),
        ),
      ),
    );
  }
}
