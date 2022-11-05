import 'package:e_commerce_intern/animation/fade_animation.dart';
import 'package:e_commerce_intern/view/auth/shared/custom_button.dart';
import 'package:flutter/material.dart';

import 'favourite_widget.dart';


class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(1, child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Divider(height: 2,thickness: 1,),
          Expanded(
            child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (ctx,index){
                  return Divider(
                    height: 2,
                    thickness: 1,
                  );
                } ,
                itemBuilder: ( ctx,index )=> Container(
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height*0.15 ,
                        child: SizedBox(child: FavouriteWidget())
                    ))),
          ),
          SizedBox(
              width: double.infinity,
              child: CustomButton(word: 'Add All To Cart', fun: (){},)),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),

        ],
      ),
    ));
  }
}
