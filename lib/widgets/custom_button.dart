import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      this.onTap,
      required this.text,
<<<<<<< HEAD
       this.fontSize=18,
      required this.textcolor,
=======
      required this.textColor,
>>>>>>> f19aa386997383b43244555cc8c463926469f24c
      required this.color,
      required this.height,
      required this.width});
  String? text;
  VoidCallback? onTap;
  Color? color;
  Color? textColor;
  double height;
  double width;
  double fontSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5,bottom: 5),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF14213D)),
              borderRadius: BorderRadius.circular(13),
              color: color),
          height: height,
          width: width,
          child: Center(
              child: Text(
            text!,
            style: TextStyle(
              color: textColor,
              fontFamily: 'medium',
<<<<<<< HEAD
              fontSize: fontSize.sp,
              fontWeight: FontWeight.bold,
=======
              fontSize: 18.sp,
            
>>>>>>> f19aa386997383b43244555cc8c463926469f24c
            ),
          )),
        ),
      ),
    );
  }
}
