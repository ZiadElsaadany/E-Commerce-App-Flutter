import 'package:e_commerce_intern/view/home/shared_/minus_plus_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 1,
              child: Image.asset('assets/images/img_11.png')),
            SizedBox(width: MediaQuery.of(context).size.width*0.11,),
            Expanded(
              flex: 3,
              child: Column (

                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bell Pepper Red',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ), ),
                Text(
                  '1kg, Price',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey
                ),),
                SizedBox(height: 15,),


                Row (
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Image.asset('assets/images/img_14.png',width: 15,)
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('1',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Image.asset('assets/images/img_15.png',width: 12,)
                    ),
                  ],
                )
              ],
          ),
            ),

            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.backspace),
                SizedBox(height: 30,),
                Text('\$4.99',style: TextStyle(
                    fontWeight: FontWeight.bold,
                  fontSize: 15
                ),)
              ],
                // MALEK 3MY
          ),
            )
        ],
      ),
    ) ;
  }
}

/*
*
*
* */