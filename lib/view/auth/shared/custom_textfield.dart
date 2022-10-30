import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
   CustomTextField({Key? key,this.labelText,this.hintText,this.suffixIcon=false}) : super(key: key);
String ?labelText;
String ?hintText;
bool    suffixIcon ;
bool check =false ;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return    TextFormField(
      obscureText:widget.check,
      decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
        suffixIcon: widget.suffixIcon ?InkWell(
          onTap: ( ){
              widget.check = !widget.check;
            setState(() {});
          },
          child: Icon(
         widget.check?    Icons.visibility_off_outlined:Icons.visibility
          ),
        )  :null
      ),
    );
  }
}
