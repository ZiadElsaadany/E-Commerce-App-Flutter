import 'package:flutter/material.dart';

import '../../../utls/app_constant.dart';

class CustomButton extends StatelessWidget {
   const CustomButton({Key? key,required this.word,required this.txt}) : super(key: key);
final String word;
final String txt;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.all(20)),
            backgroundColor: MaterialStateProperty.all(ConstantApp.greenColor),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
            ))
        ),
        onPressed: (){
          Navigator.pushReplacementNamed(context, txt);
        }, child: Text(
    word,
      style: TextStyle(
          fontSize: 18
      ),
    ));
  }
}
