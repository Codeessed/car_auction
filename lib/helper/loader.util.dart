import 'package:car_sale_app/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppLoaderUtil {
  static showPrimaryLoading(String msg) {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.threeBounce
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 20.0
      ..radius = 10.0
      ..progressColor = appBackgroundColor
      ..backgroundColor = Colors.white
      ..indicatorColor = appPrimaryColor
      ..textColor = appPrimaryColor
      ..maskColor = Colors.orangeAccent
      ..userInteractions = false
      ..dismissOnTap = false;

    EasyLoading.show(
        status: msg,
        maskType: EasyLoadingMaskType.custom,
        indicator: Container(
          width: double.infinity,
          child: SpinKitSpinningLines(
            color: appPrimaryColor,
          ),
        ));
  }

  static showSecondaryLoading(String msg) {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.threeBounce
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 20.0
      ..progressColor = Colors.black
      ..backgroundColor = appPrimaryColor
      ..indicatorColor = Colors.black
      ..textColor = Colors.black
      ..userInteractions = false
      ..dismissOnTap = false;

    EasyLoading.show(
      status: msg,
      maskType: EasyLoadingMaskType.none,
    );

  }

  static dismiss() {
    EasyLoading.dismiss();
  }

}
