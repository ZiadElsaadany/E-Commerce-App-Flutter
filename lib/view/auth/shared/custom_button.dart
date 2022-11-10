import 'package:e_commerce_intern/providers/bottomNavProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utls/app_constant.dart';

class CustomButton extends StatelessWidget {
    CustomButton({Key? key,required this.word,required this.fun, this.totalPrice}) : super(key: key);
final String word;
 double ? totalPrice;

final VoidCallback fun ;
  @override
  Widget build(BuildContext context) {
    return   ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.all(20)),
            backgroundColor: MaterialStateProperty.all(ConstantApp.greenColor.withOpacity(0.8)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
            ))
        ),
        onPressed:fun, child: Provider.of<BottomNavProvider>(context).currentIndex==2 ?
        Row( children: [
          Spacer(),
          Text(word,
          style: TextStyle(
              fontSize: 18
          ),
        ),
          Spacer(),
          Text('$totalPrice',
          style: TextStyle(
            backgroundColor: Colors.black,
          ),
          ),
          SizedBox( width: 10,)


        ],)
        : Text(word,
      style: TextStyle(
          fontSize: 18
      ),
    ));
  }
}
