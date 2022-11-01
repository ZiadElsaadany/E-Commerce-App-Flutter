import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_intern/utls/app_constant.dart';
import 'package:e_commerce_intern/view/home/shared_/search_widget.dart';
import 'package:e_commerce_intern/view/home/shop_screen/listViewScrollable_widget.dart';
import 'package:e_commerce_intern/view/home/shop_screen/listview_widget.dart';
import 'package:e_commerce_intern/view/home/shop_screen/title_widget.dart';
import 'package:e_commerce_intern/view/card_details/card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SearchWidget(),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          Image.asset('assets/images/img_9.png') ,
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          const TitleWidgetForCards(txt:'Exclusive Offer' ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
           ListViewScrollable(),

          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          const TitleWidgetForCards(txt:'Best Selling' ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          const            ListViewScrollable(),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.13,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx,index){
              return Container(
                // alignment: Alignment.center,
                width: MediaQuery.of(context).size.width*0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffF7A593).withOpacity(0.25)
                ),
                child:Row(
                  children: [
                    SizedBox(width: 20,),
                    Image.asset('assets/images/img_12.png',width: 60),
                    SizedBox(width: 20,),
                    Text('Pulses'),
                  ],
                ),
              ) ;
            }, separatorBuilder: (ctx,index) {
              return SizedBox(width: 5,);
            }, itemCount: 10),
          ),
          SizedBox(height: 15,),
          const TitleWidgetForCards(txt:'Groceries' ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          const            ListViewScrollable(),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),




        ],
      ),
    );
  }
}
