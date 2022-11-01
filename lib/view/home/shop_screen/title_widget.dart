import 'package:flutter/material.dart';

import '../../../utls/app_constant.dart';

class TitleWidgetForCards extends StatelessWidget {
  const TitleWidgetForCards({Key? key,required this.txt}) : super(key: key);
final String txt ;
  @override
  Widget build(BuildContext context) {
    return           Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text (txt,style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18
        ),) ,
        Text ( 'See all',style: TextStyle(
            color: ConstantApp.greenColor,
            fontWeight: FontWeight.bold,
            fontSize: 15

        ), ) ,
      ],
    ) ;
  }
}
