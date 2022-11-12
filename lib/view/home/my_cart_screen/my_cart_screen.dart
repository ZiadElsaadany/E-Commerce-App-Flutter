import 'package:e_commerce_intern/models/cart_model/cart_model.dart';
import 'package:e_commerce_intern/providers/cart_provider.dart';
import 'package:e_commerce_intern/utls/app_constant.dart';
import 'package:e_commerce_intern/view/auth/shared/custom_button.dart';
import 'package:e_commerce_intern/view/home/my_cart_screen/bottom_sheet_screen.dart';
import 'package:e_commerce_intern/view/home/my_cart_screen/cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../providers/authProvider.dart';
import '../../../providers/product_details_provider.dart';
import '../../card_details/card_details_screen.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, ( ) async {
      Provider.of<CartProvider>(context,listen: false).getCarts(
          token: Provider.of<AuthProvider>(context,listen: false).token
      );
    } ) ;
  }
  @override
  Widget build(BuildContext context) {
    return   Provider.of<CartProvider>(context).loading?  Center(
      child: CircularProgressIndicator(
        color: ConstantApp.greenColor,
      ),
    ):   Provider.of<CartProvider>(context).getCartList.isEmpty ? 
    
    Center(child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/cart.png',width:
          MediaQuery.of(context).size.width*0.35
          ,color: Colors.grey,),
        const SizedBox(height: 20,),
         Text('No Products in your Cart ',style: TextStyle(
          color: Colors.black.withOpacity(0.6),
           fontWeight:FontWeight.bold,
           fontSize: 18
        ),)
      ],
    )) : Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                separatorBuilder: ( ctx,index) => Divider(
                  height: 1,
                  thickness: 1,
                ),
                itemCount:   Provider.of<CartProvider>(context).getCartList.length,
                itemBuilder:
                    ( ctx,index)  {
                  return  GestureDetector(
                    onTap: ( )  {
                      Provider.of<ProductDetailsProvider>(context,listen: false).showProductDetails(
                          token:    Provider.of<AuthProvider>(context,listen: false).token,

                          id:
                      Provider.of<CartProvider>(context,listen: false).getCartList[index]['product'] ['id']
                      );

                      Navigator.pushNamed(context, CardDetails.id);

                    } ,
                    child: CartWidget(
                      cartModel: CartModel (
                          img: Provider.of<CartProvider>(context).getCartList[index]['product']['image'],
                          price: Provider.of<CartProvider>(context).getCartList[index]['product']['price'],
                          name: Provider.of<CartProvider>(context).getCartList[index]['product']['name'],
                          id: Provider.of<CartProvider>(context).getCartList[index]['product']['id'],
                          subName: Provider.of<CartProvider>(context).getCartList[index]['quantity'],
                          quantity: Provider.of<CartProvider>(context).getCartList[index]['quantity']

                      ),),
                  );
                }
            ),
          ),
          SizedBox(

width: double.infinity,              child: CustomButton(


              word: 'Go To CheckOut', fun: ( ){
              // print (Provider.of<CartProvider>(context,listen: false).datta['total']);
            showModalBottomSheet(
              context: context ,
              builder: (context)  {
                return BottomSheetScreen();
              }
            );

          })),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
/**/