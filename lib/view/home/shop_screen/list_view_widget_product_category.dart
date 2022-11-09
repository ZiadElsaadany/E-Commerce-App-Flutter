import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_intern/providers/home_provider.dart';
import 'package:e_commerce_intern/view/card_details/card_details_screen.dart';
import 'package:e_commerce_intern/view/home/shop_screen/card_widget_category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/product_details_provider.dart';



class ListViewWidgetProductCategory extends StatelessWidget {
  const ListViewWidgetProductCategory({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return   CarouselSlider(

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
            return InkWell(
              onTap: ( ) {
                Provider.of<ProductDetailsProvider>(context,listen: false).showProductDetails(id: i['id']);
                Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                  return CardDetails() ;
                } ));
              },
              child: CardWidgetCategory(
                img: i['image'],
                name: i['name'],
                price: i['price'],

              ),
            );
          },
        );
      }).toList(),
    );
  }
}