import 'package:e_commerce_intern/animation/fade_animation.dart';
import 'package:e_commerce_intern/providers/favourtie_provider.dart';
import 'package:e_commerce_intern/providers/product_details_provider.dart';
import 'package:e_commerce_intern/utls/app_constant.dart';
import 'package:e_commerce_intern/view/auth/shared/custom_button.dart';
import 'package:e_commerce_intern/view/card_details/card_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/cart_model/cart_model.dart';
import 'favourite_widget.dart';


class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, ( ) async {
      Provider.of<Favourite>(context,listen: false).getFavourite();
    } ) ;
  }
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(1, child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
      child:   Provider.of<Favourite>(context,listen: false).fav.isEmpty&&
          Provider.of<Favourite>(context).loadingWhenGet==false
      ?

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset('assets/images/no_fav.jpg'),
            ],
          )
          :  Provider.of<Favourite>(context).loadingWhenGet? Center(
            child: CircularProgressIndicator(
              color: ConstantApp.greenColor,

      ),
          )  :  Column(
        children: [
          Divider(height: 2,thickness: 1,),
          Expanded(
            child: ListView.separated(
                itemCount: Provider.of<Favourite>(context).fav.length,
                separatorBuilder: (ctx,index){
                  return Divider(
                    height: 2,
                    thickness: 1,
                  );
                } ,
                itemBuilder: ( ctx,index )=> Container(
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height*0.20 ,
                        child: SizedBox(child: GestureDetector(
                          onTap: ( ) {
                            Provider.of<ProductDetailsProvider>(context,listen: false).showProductDetails(id:
                            Provider.of<Favourite>(context,listen: false).fav[index]['product'] ['id']
                            );
                            Navigator.pushNamed(context, CardDetails.id);
                          },
                          child: FavouriteWidget(

                            cartModel: CartModel (
                                img: Provider.of<Favourite>(context).fav[index]['product'] ['image'] ,
                                price: Provider.of<Favourite>(context).fav[index] ['product']['price'],
                                name: Provider.of<Favourite>(context).fav[index] ['product']['name'],
                                id: Provider.of<Favourite>(context).fav[index]['product'] ['id'],
                                subName: Provider.of<Favourite>(context).fav[index] ['product']['discount'],
                                quantity: Provider.of<Favourite>(context).fav[index]['product'] ['discount']

                            ),
                          ),
                        ))
                    ))),
          ),
          SizedBox(
              width: double.infinity,
              child: CustomButton(word: 'Add All To Cart', fun: (){}
              ,)),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),

        ],
      ),
    ));
  }
}
