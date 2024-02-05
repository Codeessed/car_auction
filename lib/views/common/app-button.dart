import 'package:car_sale_app/theme/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color? btnColor;
  final Color? textColor;
  final Function() onTap;
  const AppButton( this.text, {super.key, this.textColor, required this.onTap, this.btnColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: btnColor,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 15.0, 12.0, 15.0),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: textColor,
                  fontSize: ts3,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
        ),
      ),
    );
  }
}
