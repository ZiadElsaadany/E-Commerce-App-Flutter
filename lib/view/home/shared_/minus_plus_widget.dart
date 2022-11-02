import 'package:flutter/material.dart';

class MinusPlusWidget extends StatelessWidget {
  const MinusPlusWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/img_14.png',width: 20,),
        SizedBox(width: 15,),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey)
          ),
          child: Text('1',style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),),
        ),
        SizedBox(width: 15,),
        Image.asset('assets/images/img_15.png',width: 20,),


      ],
    );
  }
}
