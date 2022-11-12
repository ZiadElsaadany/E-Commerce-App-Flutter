import 'package:e_commerce_intern/view/auth/shared/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/cart_provider.dart';
import '../shop_screen/card_widget_category.dart';

class BottomSheetScreen extends StatelessWidget {
  const BottomSheetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween
            ,
            children: [
              Text('Checkout',style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.6),
                fontSize: 20
              ),),
              IconButton(onPressed: (){Navigator.pop(context);}, icon:Icon(Icons.close,color: Colors.black,size:30,))
            ],
          ) ,
          // SizedBox(height: MediaQuery.of(context).size.height*0.02,),

          Card(
            elevation: 10,
            child: Padding(
              padding:  EdgeInsets.all (  MediaQuery.of(context).size.height*0.03,),
              child:  Column(
                children: [
                  Text( 'Total Cost',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                  Text('\$${Provider.of<CartProvider>(context,listen: false).datta['total']}',
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold
                    ),) ,
                ],
              ),
            ),
          ) ,
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),

          SizedBox(
            height: MediaQuery.of(context).size.height*0.2,

            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
itemCount: Provider.of<CartProvider>(context).getCartList.length,
                itemBuilder: (ctx , index) {
              return SizedBox(
                width: MediaQuery.of(context).size.width*0.4,
                child: CardWidgetCategory(

                  img:Provider.of<CartProvider>(context).getCartList[index]['product']['image']?? '' ,
                  price:Provider.of<CartProvider>(context).getCartList[index]['product']['price']  ?? 0,
                  name:Provider.of<CartProvider>(context).getCartList[index]['product']['name'] ?? '',
                  id:Provider.of<CartProvider>(context).getCartList[index]['product']['id']?? 0 ,

                ),
              );
            }),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),


          SizedBox(
              width: double.infinity  ,
              child: CustomButton(word: 'Place Order', fun: (){}))
        ],
      ),
    );
  }
}
