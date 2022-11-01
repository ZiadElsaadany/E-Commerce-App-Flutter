import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../widgets/card_widget.dart';

class ListViewScrollable extends StatelessWidget {
  const ListViewScrollable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height:MediaQuery.of(context).size.width*0.5,
      child: CarouselSlider(

        options: CarouselOptions(
          height: 400,
          aspectRatio: 50/9,
          viewportFraction: 0.5,
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
        items:   ['assets/images/img_8.png','assets/images/img_7.png','assets/images/img_11.png','assets/images/img_11.png'].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return CardWidget(img: i);
            },
          );
        }).toList(),
      ),
    );
  }
}
