import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavouriteWidget extends StatelessWidget {
  const FavouriteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset('assets/images/img_13.png'),
          )),
          SizedBox(width: 5),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text( 'Sprite Can',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18),) ,
                Text( '335ml. Price',style: TextStyle(
                    color: Colors.grey
                ),) ,
              ],
            ),

          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$1.99',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ), ) ,
                Icon(Icons.arrow_forward_ios)
            ]
            ) ,
          )
        ],
      ),
    );
  }
}
