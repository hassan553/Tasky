import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast({
  required String msg,
  bool? isError,
}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: isError ?? false ? Colors.red : Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}
