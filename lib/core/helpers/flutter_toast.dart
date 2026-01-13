import 'package:doctor_reservation_app/core/networking/api_error_model.dart';
import 'package:doctor_reservation_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterToast {
  static Future<bool?> showFlutterToast({
    required Object message,
    required ToastStates state,
    required BuildContext context,
  }) {
    final toastMessage = checkMessageType(message);
    return Fluttertoast.showToast(
      msg: toastMessage,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: _choseToastStateColor(state),
      textColor: AppColor.whiteColor,
      fontSize: 16.0,
    );
  }

  static String checkMessageType(Object message) {
    if (message is String) {
      return message;
    } else if (message is ApiErrorModel) {
      return message.getAllErrorMessages();
    } else {
      return 'Something went wrong';
    }
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
