import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_intern/animation/fade_animation.dart';
import 'package:e_commerce_intern/providers/favourtie_provider.dart';
import 'package:e_commerce_intern/providers/product_details_provider.dart';
import 'package:e_commerce_intern/utls/app_constant.dart';
import 'package:e_commerce_intern/view/auth/shared/custom_button.dart';
import 'package:e_commerce_intern/view/home/shared_/minus_plus_widget.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider.dart';

class CardDetails extends StatefulWidget {
  static const String id = 'cardDetails';

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  bool _customTileExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: Provider.of<Favourite>(context).loadingWhenPost,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: SafeArea(
          child:
              Consumer<ProductDetailsProvider>(builder: (context, provider, _) {
            return provider.data.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: ConstantApp.greenColor,
                    ),
                  )
                : ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      FadeAnimation(1.2,
                          child: CarouselSlider(
                            options: CarouselOptions(
                              height: MediaQuery.of(context).size.height * 0.3,
                              aspectRatio: 100 / 20,
                              viewportFraction: 0.9,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 5),
                              autoPlayAnimationDuration: Duration(seconds: 2),
                              autoPlayCurve: Curves.easeInOutCubic,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                            ),
                            items: [
                                for(int j = 0 ; j<provider.data['images'].length; j++ ) ...[
                                  Card(
                                    elevation: 8,
                                    child:FadeInImage.assetNetwork(
                                      fit: BoxFit.cover,
                                        placeholder: 'assets/images/loadingPicture.jpg',
                                       imageErrorBuilder: ( n,b,v){
                                         return Image.asset('assets/images/loadingPicture.jpg');
                                       },
                                       image:  provider.data['images'][j]),
                                  )


                              ]
                            ]
                          ),
                      ),
//
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: IconButton(
                                      onPressed: () {
                                        Provider.of<Favourite>(context,
                                                listen: false)
                                            .addToFav(
                                                productId: provider.data['id']);
                                      },
                                      icon: Icon(
                                        Icons.favorite,
                                        size: 30,
                                        color: Colors.grey,
                                      )),
                                ),
                                Expanded(
                                  flex: 7,
                                  child: Text(
                                    provider.data['name'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Row(
                              children: [
                                MinusPlusWidget(),
                                Spacer(),
                                Column(
                                  children: [
                                    Text(
                                        'old Price: \$${provider.data['old_price']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.grey)),
                                    Text(
                                        'discount: \$${provider.data['discount']}',
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18)),
                                  ],
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  '\$${provider.data['price']}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black.withOpacity(0.7)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            ExpansionTile(
                              iconColor: ConstantApp.greenColor,
                              title: Text(
                                'Product Details',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: _customTileExpanded
                                      ? ConstantApp.greenColor
                                      : Colors.black.withOpacity(0.6),
                                ),
                              ),
                              trailing: Icon(
                                _customTileExpanded
                                    ? Icons.arrow_circle_up
                                    : Icons.arrow_circle_down,
                              ),
                              collapsedIconColor: _customTileExpanded
                                  ? Colors.green
                                  : Colors.black.withOpacity(0.5),
                              children: <Widget>[
                                ListTile(
                                  title: Text(
                                    provider.data['description'].trim(),
                                    textDirection: TextDirection.ltr,
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17),
                                  ),
                                ),
                              ],
                              onExpansionChanged: (bool expanded) {
                                setState(() => _customTileExpanded = expanded);
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Review',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black.withOpacity(0.7)),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: ConstantApp.greenColor,
                                  )
                                ]),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            SizedBox(
                                width: double.infinity,
                                child:   Provider.of<CartProvider >(context).loadingAddedOrDeleted? Center(
                                  child: CircularProgressIndicator(
                                    color: ConstantApp.greenColor,
                                  ),
                                ) :CustomButton(
                                  word: 'Add/Delete -->Basket',
                                  fun: () {
                                    Provider.of<CartProvider >(context,listen: false).addToCarts(productId:provider.data['id']??0);
                                  },
                                )),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                          ],
                        ),
                      )
                    ],
                  );
          }),
        ),
      ),
    );
  }
}
