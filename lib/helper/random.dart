import 'package:car_sale_app/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class RandomFunction {

  static toast(String msg, {bool isError = false}) {
    showSimpleNotification(Text(msg),
        background: isError ? Colors.red : Colors.green);
  }

}
