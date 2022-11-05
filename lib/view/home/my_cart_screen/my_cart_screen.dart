import 'package:e_commerce_intern/view/auth/shared/custom_button.dart';
import 'package:e_commerce_intern/view/home/my_cart_screen/cart_widget.dart';
import 'package:flutter/material.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Divider(thickness: 2,),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              separatorBuilder: ( ctx,index) => Divider(
                height: 1,
                thickness: 2,
              ),
              itemCount: 10,
                itemBuilder:
            ( ctx,index)  {
              return  CartWidget();
            }
            ),
          ),
        ),
         SizedBox(
             width: double.infinity,
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 15.0),
               child: CustomButton(word: 'Go to Checkout',fun:  ( )  { },),
             )),
        SizedBox(height: MediaQuery.of(context).size.height*0.025,),
      ],
    );
  }
}
