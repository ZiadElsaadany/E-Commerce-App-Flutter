
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/cart_provider.dart';
import '../../../providers/product_details_provider.dart';

class CardWidgetCategory extends StatelessWidget {
   CardWidgetCategory({
    Key? key,
    required this.img,
    required this.name,
    required this.price,
    this.id
  }) : super(key: key);

  final String name;
  final String img;
  final num? price;
  num? id;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(
            color: Colors.black,
            width: 0.1,
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FadeInImage.assetNetwork(
                  imageErrorBuilder: (m, c, v) {
                    return Image.asset('assets/images/loadingPicture.jpg');
                  },
                  image: img,
                  placeholder: 'assets/images/loadingPicture.jpg',
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        name.trim(),
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5), fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        // textDirection: TextDirection.rtl,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Expanded(
            //   flex: 2,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       Text(
            //         '\$$price',
            //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.black.withOpacity(0.6)),
            //       ),
            //       Builder(
            //         builder: (context) {
            //           return GestureDetector(
            //             onTap: (){
            //               Provider.of<CartProvider >(context,listen: false).addToCarts(productId:id);
            //
            //               // Provider.of<CartProvider>(context,listen: false).getCar;
            //
            //             },
            //             child:   Image.asset(
            //               'assets/images/img_10.png',
            //               width: MediaQuery.of(context).size.width * 0.08,
            //             ),
            //           );
            //         }
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
