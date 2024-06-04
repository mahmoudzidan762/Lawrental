import 'package:flutter/material.dart';

class customTextField extends StatelessWidget {
  customTextField(
      {this.height = 50,
      this.color,
      this.width = 50,
      required this.text,
      this.textColor,
      this.fontFamily});

  final Color? color, textColor;
  final double width, height;
  final String text;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: height, horizontal: 16),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          label: Text(
            text,
            style: TextStyle(
                color: textColor,
                fontFamily: fontFamily,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
