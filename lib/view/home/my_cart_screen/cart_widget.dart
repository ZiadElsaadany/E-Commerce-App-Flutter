import 'package:e_commerce_intern/view/home/shared_/minus_plus_widget.dart';
import 'package:flutter/material.dart';

import '../../../models/cart_model/cart_model.dart';


class CartWidget extends StatelessWidget {
  const CartWidget({Key? key, required this.cartModel}) : super(key: key);
  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 1, child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/loadingPicture.jpg',
              image: cartModel.img)),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.11,
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartModel.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,

                ),
                Text(
                  '${cartModel.quantity},Price',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(12)),
                        child: Image.asset(
                          'assets/images/img_14.png',
                          width: 15,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${cartModel.quantity}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(12)),
                        child: Image.asset(
                          'assets/images/img_15.png',
                          width: 12,
                        )),
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
                SizedBox(
                  height: 30,
                ),
                Text(
                  '\$${cartModel.price}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                )
              ],
              // MALEK 3MY
            ),
          )
        ],
      ),
    );
  }
}

/*
*
*
* */
