import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Common {
  static void showToast(
      {required String msg, int timeInSec = 1, bool isError = false}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: timeInSec,
      backgroundColor: isError ? Colors.red : Colors.green,
      textColor: Colors.white,
    );
  }
}
