import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ConstantApp {
  static Color greenColor =Colors.green;
   toast (
      {required String msg ,required Color color,required ToastGravity ss})
  {
   Fluttertoast.showToast(
       msg: msg,
       toastLength: Toast.LENGTH_SHORT,
       gravity: ss,
       timeInSecForIosWeb: 1,
       backgroundColor:color,
       textColor: Colors.white,
       fontSize: 16.0
   );
  }

}