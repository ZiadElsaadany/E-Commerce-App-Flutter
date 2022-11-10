import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_intern/providers/home_provider.dart';
import 'package:e_commerce_intern/providers/product_details_provider.dart';
import 'package:e_commerce_intern/utls/app_constant.dart';
import 'package:e_commerce_intern/view/card_details/card_details_screen.dart';
import 'package:e_commerce_intern/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/product_model/Products.dart';
import '../../../providers/cart_provider.dart';
import '../../card_details/card_widget.dart';

class ListViewScrollable extends StatelessWidget {
  const ListViewScrollable({Key? key,required this.product,  }) : super(key: key);
  final List<Products>  product ;

  @override
  Widget build(BuildContext context) {
    return    CarouselSlider(

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
      items:  product.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return InkWell(
              onTap: ( ) { 
                Provider.of<ProductDetailsProvider>(context,listen: false).showProductDetails(id: i.id);
                Navigator.push(context, MaterialPageRoute(builder: (ctx)
                {
                  return CardDetails();
                } ));
              },
              child: CardWidget(
                product: i,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
