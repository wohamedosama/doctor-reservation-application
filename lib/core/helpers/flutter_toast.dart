import 'package:doctor_reservation_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterToast {
  static Future<bool?> showFlutterToast({
    required String message,
    required ToastStates state,
    required BuildContext context,
  }) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: _choseToastStateColor(state),
      textColor: AppColor.whiteColor,
      fontSize: 16.0,
    );
  }
}

enum ToastStates {
  success,
  error,
  warning,
}

Color _choseToastStateColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;
    case ToastStates.warning:
      color = Colors.deepOrange;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
  }
  return color;
}
