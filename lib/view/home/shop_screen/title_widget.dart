import 'package:flutter/material.dart';

import '../../../utls/app_constant.dart';

class TitleWidgetForCards extends StatelessWidget {
  const TitleWidgetForCards({Key? key,required this.txt}) : super(key: key);
final String txt ;
  @override
  Widget build(BuildContext context) {
    return           Text (txt,style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18
    ),) ;
  }
}
