import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_intern/animation/fade_animation.dart';
import 'package:e_commerce_intern/providers/favourtie_provider.dart';
import 'package:e_commerce_intern/providers/product_details_provider.dart';
import 'package:e_commerce_intern/utls/app_constant.dart';
import 'package:e_commerce_intern/view/auth/shared/custom_button.dart';
import 'package:e_commerce_intern/view/home/shared_/minus_plus_widget.dart';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../providers/authProvider.dart';
import '../../providers/cart_provider.dart';

class CardDetails extends StatefulWidget {
  static const String id = 'cardDetails';

  const CardDetails({Key? key}) : super(key: key);

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
          leading: IconButton(
            onPressed: () {
               Provider.of<CartProvider>(context,listen: false).getCarts(
                 token: Provider.of<AuthProvider>(context,listen: false).token
               );
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
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
                    physics: const BouncingScrollPhysics(),
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
                              autoPlayInterval: const Duration(seconds: 5),
                              autoPlayAnimationDuration: const Duration(seconds: 2),
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
                      const SizedBox(
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
                                      onPressed: ()  {
                                        Provider.of<Favourite>(context,
                                            listen: false)
                                            .addToFav(
                                            token:    Provider.of<AuthProvider>(context,listen: false).token,
                                            productId: provider.data['id']);
                                        Provider.of<ProductDetailsProvider>(context,listen: false).changeInFav(provider.inFav);
                                        Provider.of<Favourite>(context,listen: false).getFavourite(
                                          token:    Provider.of<AuthProvider>(context,listen: false).token,
                                        ) ;
                                        // Provider.of<ProductDetailsProvider>(context,listen: false).showProductDetails(id: provider.data['id']) ;
                                      },
                                      icon: Icon(
                                        provider.inFav ?  Icons.favorite  :  Icons.favorite_border_outlined,
                                        size: 30,
                                        color: Colors.red,
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
                                const MinusPlusWidget(),
                                const Spacer(),
                                Column(
                                  children: [
                                    Text(
                                        'old Price: \$${provider.data['old_price']}',
                                        style: const TextStyle(
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
                                const SizedBox(
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
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17),
                                  ),
                                ),
                              ],
                              onExpansionChanged: (bool expanded) {
                                setState(() => _customTileExpanded = expanded);
                              },
                            ),
                            const SizedBox(
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
                                child:

                                Provider.of<CartProvider >(context).loadingAddedOrDeleted?
                                    Center(
                                      child: CircularProgressIndicator(
                                        color: ConstantApp.greenColor,
                                      ),
                                    ):
             CustomButton(
                                  word:  Provider.of<ProductDetailsProvider >(context).isCart?'Delete From Basket' : 'Add To Basket',
                                  fun: ()  {

                                    Provider.of<CartProvider >(context,listen: false).addToCarts(productId:provider.data['id'],
                                 token:    Provider.of<AuthProvider>(context,listen: false).token
                                    );
                                    Provider.of<ProductDetailsProvider >(context,listen: false).changeInCart(


                                        Provider.of<ProductDetailsProvider >(context,listen: false).isCart
                                    );

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
