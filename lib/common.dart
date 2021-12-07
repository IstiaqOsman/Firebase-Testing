import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Common {
  void customtoast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.red,
        fontSize: 16.0
    );
  }
}
