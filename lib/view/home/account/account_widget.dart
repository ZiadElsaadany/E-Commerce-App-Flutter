import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({Key? key,required this.txt}) : super(key: key);
final String txt;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.all(MediaQuery.of(context).size.height*0.025),
          child: Row(children: [
              Icon(Icons.payment),
              SizedBox(width: 15,),
              Text(txt, style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
              ) ,
              Spacer( ),
                Icon(Icons.arrow_forward_ios),
              SizedBox(width: 10,),

            ],

          ),
        ),
        Divider( height: 2,thickness: 1,),
      ],
    );
  }
}
