import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  final double? size;
  final FontWeight? weight;
  final Color? textColor;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  const CustomText({
    super.key,
   required this.title,
    this.size,
    this.weight,
    this.textColor,
    this.overflow,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toString(),
      textAlign: textAlign??TextAlign.start,
      overflow: overflow,

      style: TextStyle(fontSize: size, fontWeight: weight, color: textColor),
    );
  }
}
