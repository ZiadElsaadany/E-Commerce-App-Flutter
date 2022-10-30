import 'package:flutter/material.dart';

import '../../../utls/app_constant.dart';

class SignInSignUp extends StatelessWidget {
   SignInSignUp({Key? key,required this.route_name,required this.txt1,required this.txt2}) : super(key: key);
String route_name;
String txt1;
   String txt2;
  @override
  Widget build(BuildContext context) {
    return    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
  Text( txt1,style: TextStyle(
  fontWeight:FontWeight.bold
  ),),
  InkWell(
  onTap: ( ) {
  Navigator.pushNamed(context, route_name);
  },
  child: Text( txt2,
  style: TextStyle(
  color: ConstantApp.greenColor,
  fontWeight: FontWeight.bold
  ),),
  ),
  ],
  );
  }
}
