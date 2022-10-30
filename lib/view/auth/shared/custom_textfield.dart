import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({Key? key,this.labelText,this.hintText,this.suffixIcon}) : super(key: key);
String ?labelText;
String ?hintText;
Widget   ?suffixIcon ;
  @override
  Widget build(BuildContext context) {
    return    TextFormField(
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
        suffixIcon: suffixIcon
      ),
    );
  }
}
