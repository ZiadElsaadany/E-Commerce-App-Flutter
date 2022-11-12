import 'package:e_commerce_intern/providers/authProvider.dart';
import 'package:e_commerce_intern/providers/favourtie_provider.dart';
import 'package:e_commerce_intern/providers/product_details_provider.dart';
import 'package:e_commerce_intern/utls/app_constant.dart';
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
      Provider.of<Favourite>(context,listen: false).getFavourite(
          token:    Provider.of<AuthProvider>(context,listen: false).token
      );
    } ) ;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
      child:   Provider.of<Favourite>(context,listen: false).fav.isEmpty&&
          Provider.of<Favourite>(context).loadingWhenGet==false
      ?

      Center(child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/cart.png',width:
          MediaQuery.of(context).size.width*0.2
            ,color: Colors.grey,),
          const SizedBox(height: 20,),
          Text('No Products in your Favorite ',style: TextStyle(
              color: Colors.black.withOpacity(0.4),
              fontWeight:FontWeight.bold,
              fontSize: 16
          ),)
        ],
      ))
          :  Provider.of<Favourite>(context).loadingWhenGet? Center(
            child: CircularProgressIndicator(
              color: ConstantApp.greenColor,

      ),
          )  :  Column(
        children: [
          const Divider(height: 2,thickness: 1,),
          Expanded(
            child: ListView.separated(
                itemCount: Provider.of<Favourite>(context).fav.length,
                separatorBuilder: (ctx,index){
                  return const Divider(
                    height: 2,
                    thickness: 1,
                  );
                } ,
                itemBuilder: ( ctx,index )=> SizedBox(
                    height: MediaQuery.of(context).size.height*0.20 ,
                    child: SizedBox(child: GestureDetector(
                      onTap: ( ) {
                        Provider.of<ProductDetailsProvider>(context,listen: false).showProductDetails(
                            token:    Provider.of<AuthProvider>(context,listen: false).token,

                            id:
                            Provider.of<Favourite>(context,listen: false).fav[index]['product'] ['id']
                        );
                        Navigator.pushNamed(context, CardDetails.id);
                      },
                      child: Dismissible(
                        key: UniqueKey( ) ,
                        onDismissed: ( direction) {
                           Provider.of<Favourite>(context,listen: false).addToFav(
                               token:    Provider.of<AuthProvider>(context,listen: false).token,
                              productId: Provider.of<Favourite>(context,listen: false).fav[index]['product'] ['id']).then((value) {
                             Provider.of<Favourite>(context,listen: false).getFavourite(
                               token:    Provider.of<AuthProvider>(context,listen: false).token,
                             ) ;
                           });


                        },
                        background:Container(
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          decoration:  const BoxDecoration(
                              color: Colors.red
                          ),
                          child:  const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Icon(
                              Icons.delete, color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ) ,
                        secondaryBackground:Container(
                          alignment: Alignment.centerLeft,
                          decoration:  BoxDecoration(
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ) ,


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
                      ),
                    ))
                )),
          ),
          // SizedBox(
          //     width: double.infinity,
          //     child: CustomButton(word: 'Add All To Cart', fun: (){
          //             for(int i = 0; i<Provider.of<Favourite>(context,listen: false).fav.length ; i++ ) {
          //               Provider.of<CartProvider>(context,listen: false).addToCarts(
          //                   token: Provider.of<AuthProvider>(context,listen: false).token,
          //                   productId: Provider.of<Favourite>(context,listen: false).fav[i]['product'] ['id']);
          //             }
          //     }
          //     ,)),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),

        ],
      ),
    );
  }
}
