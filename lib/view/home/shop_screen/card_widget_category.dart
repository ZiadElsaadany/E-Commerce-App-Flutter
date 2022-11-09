import 'package:e_commerce_intern/models/product_model/Product_model.dart';
import 'package:e_commerce_intern/providers/product_details_provider.dart';
import 'package:e_commerce_intern/view/card_details/card_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CardWidgetCategory extends StatelessWidget {
  const CardWidgetCategory({Key? key,
    required this.img,
    required this.name ,
    required this.price,

  }) : super(key: key);

  final String name;
  final String img;
  final num? price ;


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(
              color: Colors.black,
              width: 0.1,
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
                  image:  img ,
                  placeholder: 'assets/images/loadingPicture.jpg',
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(name,style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
                  maxLines: 1,
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
                  Text('\$$price',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),),
                  Image.asset('assets/images/img_10.png',width: MediaQuery.of(context).size.width*0.08,)

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
