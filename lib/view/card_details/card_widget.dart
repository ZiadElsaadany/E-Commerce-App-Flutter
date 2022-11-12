import 'package:e_commerce_intern/models/product_model/Product_model.dart';
import 'package:e_commerce_intern/providers/cart_provider.dart';
import 'package:e_commerce_intern/providers/product_details_provider.dart';
import 'package:e_commerce_intern/view/card_details/card_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product_model/Products.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key,required this.product
  }) : super(key: key);

final Products product;


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          color: Colors.black,
          width: 0.1
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex:7,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FadeInImage.assetNetwork(
                  imageErrorBuilder: (m,c,v){
                    return  Image.asset('assets/images/loadingPicture.jpg');
                  },
                  image:  product.image??'' ,
                placeholder: 'assets/images/loadingPicture.jpg',
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(product.name??'',style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.bold
                ),
                maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),

            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('\$${product.price}',style: TextStyle(
                    fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.6),
                    fontSize: 16
                  ),),
                  GestureDetector(
                      onTap: ( )  {
                        Provider.of<CartProvider >(context,listen: false).addToCarts(productId: product.id??0);
                        Provider.of<ProductDetailsProvider >(context,listen: false).showProductDetails(id:product.id);
                      } ,
                      child: Image.asset('assets/images/img_10.png',width: MediaQuery.of(context).size.width*0.08,))

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
