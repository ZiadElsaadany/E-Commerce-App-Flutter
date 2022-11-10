import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_intern/providers/home_provider.dart';
import 'package:e_commerce_intern/utls/app_constant.dart';
import 'package:e_commerce_intern/view/card_details/card_details_screen.dart';
import 'package:e_commerce_intern/view/home/home.dart';
import 'package:e_commerce_intern/view/home/shop_screen/card_widget_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../providers/cart_provider.dart';
import '../../../providers/product_details_provider.dart';



class ListViewWidgetProductCategory extends StatelessWidget {
  const ListViewWidgetProductCategory({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // SizedBox(height: 10,),
        Expanded(
          child: CarouselSlider(

            options: CarouselOptions(
              height: 400,
              aspectRatio: 40/20,
              viewportFraction: 0.4,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds:3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
            items:  Provider.of<HomeProvider>(context).productsFromCategory.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: ( ) {
                      Provider.of<ProductDetailsProvider>(context,listen: false).showProductDetails(id: i['id']);
                      // Provider.of<HomeProvider>(context,listen: false).getNameCategory(name: i['name']);
                      Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                        return CardDetails() ;
                      } ));
                    },
                    child:
                    CardWidgetCategory(
                      img: i['image'],
                      name: i['name'],
                      price: i['price'],
                      id: i['id'],

                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
