import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final int maxLine;
  final Color color;
  final double size;
  final FontWeight? fontWeight;
  const CustomText(
      {Key? key,
      required this.text,
      this.maxLine = 2,
      this.color = Colors.black,
      this.size = 15.0,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      style: TextStyle(color: color, fontSize: size, fontWeight: fontWeight),
    );
  }
}
