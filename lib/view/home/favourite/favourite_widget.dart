import 'package:e_commerce_intern/animation/fade_animation.dart';
import 'package:e_commerce_intern/models/cart_model/cart_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavouriteWidget extends StatelessWidget {
  const FavouriteWidget({Key? key,required this.cartModel}) : super(key: key);
final CartModel cartModel ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/loadingPicture.jpg',
              image: cartModel.img,
            )
          )),
          SizedBox(width: 5),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text( cartModel.name ,

                  maxLines:  2,
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),


                    fontWeight:FontWeight.bold,fontSize: 18),) ,

              ],
            ),

          ),
          SizedBox(width: 10),

          Expanded(
            child: Text('\$${cartModel.price}',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18 ,

            ), ) ,
          )
        ],
      ),
    );
  }
}
