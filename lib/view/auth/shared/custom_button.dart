import 'package:flutter/material.dart';

import '../../../utls/app_constant.dart';

class CustomButton extends StatelessWidget {
   CustomButton({Key? key,required this.word}) : super(key: key);
String word;
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
        onPressed: (){}, child: Text(
      '$word',
      style: TextStyle(
          fontSize: 18
      ),
    ));
  }
}
