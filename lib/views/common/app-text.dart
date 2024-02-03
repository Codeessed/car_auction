
import 'dart:ffi';

import 'package:car_sale_app/theme/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget{
  final String text;
  final TextAlign align;
  final double size;
  final Color color;
  final FontWeight weight;
  final TextOverflow textOverflow;
  final TextDecoration textDecoration;
  final int? maxLines;

  const AppText( this.text, {super.key, this.align = TextAlign.start, this.size = 16.0, this.color = AppColor.textColor, this.weight = FontWeight.normal, this.textOverflow = TextOverflow.visible, this.textDecoration = TextDecoration.none, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
          fontSize: size,
          fontWeight: weight,
        color: color,
          decoration: textDecoration,
      ),
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }

}