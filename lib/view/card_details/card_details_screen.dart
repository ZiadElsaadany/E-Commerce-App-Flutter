import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_intern/animation/fade_animation.dart';
import 'package:e_commerce_intern/providers/product_details_provider.dart';
import 'package:e_commerce_intern/utls/app_constant.dart';
import 'package:e_commerce_intern/view/auth/shared/custom_button.dart';
import 'package:e_commerce_intern/view/home/shared_/minus_plus_widget.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardDetails extends StatelessWidget {

static const String id='cardDetails';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<ProductDetailsProvider>(
          builder: (context,provider,_) {

                  return provider.data.isEmpty ?
                      Center(
                        child: CircularProgressIndicator(
                          color: ConstantApp.greenColor,
                        ),
                      )
                      :  ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      FadeAnimation(1.2, child:

                  CarouselSlider(

                    options: CarouselOptions(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.3,

                      aspectRatio: 100/20,
                      viewportFraction: 0.9,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds:5),
                      autoPlayAnimationDuration: Duration(seconds: 2),
                      autoPlayCurve: Curves.easeInOutCubic,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: [
                    Container(
                    width: double.infinity,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25)
                        ),
                        color: Colors.grey.withOpacity(0.3)
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FadeInImage.assetNetwork (image: provider.data['images'][0],
                        placeholder:  'assets/images/loadingPicture.jpg',
                      ),
                    ),
                  ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25)
                            ),
                            color: Colors.grey.withOpacity(0.3)
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FadeInImage.assetNetwork (image: provider.data['images'][1],
                            placeholder:  'assets/images/loadingPicture.jpg',
                          ),
                        ),
                      ),

                    ]
                  )
                  ),
//
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: IconButton(onPressed: () {}, icon: Icon(
                                      Icons.favorite_outline_rounded,size: 30,
                                  )),
                                ),
                                Expanded(
                                  flex: 7,
                                  child: Text( provider.data['name'],
                                     maxLines: 1,
                                     overflow: TextOverflow.ellipsis,
                                     textDirection: TextDirection.rtl,
                                     style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900),),
                                ),
                              ],
                            ),
                            SizedBox(height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.03,),

                            Row(
                              children: [
                                MinusPlusWidget(),
                                Spacer(),
                                Column(
                                  children: [
                                    Text('Old Price: \$${provider.data['old_price']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold, fontSize: 15,
                                        color: Colors.grey)
                                    ),
                                    Text('Discount: \$${provider.data['discount']}',
                                        style: TextStyle(
                                          color: Colors.black,
                                            fontWeight: FontWeight.w500, fontSize: 20)),

                                  ],
                                ),
                                SizedBox(width: 15,),
                                Text('\$${provider.data['price']}', style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),)
                              ],
                            ),
                            SizedBox(height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.03,),

                            Divider(
                              height: 2,
                              thickness: 1,
                            ),
                            SizedBox(height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.03,),


                            const Text('Product Details', style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold),),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Text(

                                    provider.data['description'] ,
                                    textDirection: TextDirection.ltr,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.03,),
                            Divider(
                              height: 2,
                              thickness: 1,
                            ),
                            SizedBox(height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.01),
                            Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  const Text('Review', style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),),
                                  Icon(
                                    Icons.star, color: ConstantApp.greenColor,)
                                ]

                            ),
                            SizedBox(height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.03,),
                            SizedBox(
                                width: double.infinity,
                                child: CustomButton(
                                  word: 'Add To Basket', fun: () {},)),
                            SizedBox(height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.03,),

                          ],
                        ),
                      )

                    ],
                  );

          }
        ),
      ),
    );
  }
}
