import 'package:e_commerce_intern/models/cart_model/cart_model.dart';
import 'package:e_commerce_intern/providers/cart_provider.dart';
import 'package:e_commerce_intern/utls/app_constant.dart';
import 'package:e_commerce_intern/view/auth/shared/custom_button.dart';
import 'package:e_commerce_intern/view/home/my_cart_screen/cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      Provider.of<CartProvider>(context,listen: false).getCarts();
    } ) ;
  }
  @override
  Widget build(BuildContext context) {
    return   Provider.of<CartProvider>(context).loading?  Center(
      child: CircularProgressIndicator(
        color: ConstantApp.greenColor,
      ),
    ):     Padding(
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
                  return  CartWidget(
                    cartModel: CartModel (
                        img: Provider.of<CartProvider>(context).getCartList[index]['product']['image'],
                        price: Provider.of<CartProvider>(context).getCartList[index]['product']['price'],
                        name: Provider.of<CartProvider>(context).getCartList[index]['product']['name'],
                        id: Provider.of<CartProvider>(context).getCartList[index]['product']['id'],
                        subName: Provider.of<CartProvider>(context).getCartList[index]['quantity'],
                        quantity: Provider.of<CartProvider>(context).getCartList[index]['quantity']

                    ),);
                }
            ),
          ),
          SizedBox(

width: double.infinity,              child: CustomButton(

            totalPrice: Provider.of<CartProvider>(context).totalPrice,

              word: 'Go To CheckOut', fun: ( ){ })),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
/**/