import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_intern/providers/home_provider.dart';
import 'package:e_commerce_intern/utls/app_constant.dart';
import 'package:e_commerce_intern/view/home/shared_/search_widget.dart';
import 'package:e_commerce_intern/view/home/shop_screen/listViewScrollable_widget.dart';
import 'package:e_commerce_intern/view/home/shop_screen/list_view_widget_product_category.dart';
import 'package:e_commerce_intern/view/home/shop_screen/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../providers/cart_provider.dart';

class ShopScreen extends StatelessWidget {
   ShopScreen({Key? key}) : super(key: key);
final   List<String> images= [ 'assets/images/technology-removebg-preview.png', 'assets/images/korona-removebg-preview.png','assets/images/sports-removebg-preview.png',
'assets/images/enara.png', 'assets/images/clothes.png'
];


  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, _) {
      return Provider.of<HomeProvider>(context).loading
          ? Center(
              child: CircularProgressIndicator(
              color: ConstantApp.greenColor,
            ))
          : ModalProgressHUD(
        inAsyncCall: Provider.of<CartProvider>(context).loadingAddedOrDeleted,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          const SearchWidget(),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          CarouselSlider(
                            options: CarouselOptions(
                              height: MediaQuery.of(context).size.height * 0.15,
                              aspectRatio: 10 / 20,
                              viewportFraction: 0.9,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration: Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                            ),
                            items: provider.banners.map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return FadeInImage.assetNetwork(
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      imageErrorBuilder: (c, v, b) {
                                        return Image.asset(
                                            'assets/images/loadingPicture.jpg');
                                      },
                                      placeholder: 'assets/images/loadingPicture.jpg',
                                      image: i.image ?? '');
                                },
                              );
                            }).toList(),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          const TitleWidgetForCards(txt: 'Categories'),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          const Text('Choose The Category For Display Products',
                          style: TextStyle(
                            color: Colors.grey
                          ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.13,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (ctx, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      provider.getProductsFromCategories(
                                          id: provider.categoryTypes[index]['id']);
                                      provider.getNameCategory(name: provider.categoryTypes[index]['name']);
                                    },
                                    child: Container(
                                      // alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width * 0.7,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Color(0xffF7A593).withOpacity(0.25)),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Expanded(
                                            child: Image.asset(
                                                images[index] ,
                                                width: 60),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Expanded(
                                              child: Text(
                                            provider.categoryTypes[index]['name'],
                                            style:
                                                TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.black.withOpacity(0.6)
                                                ),
                                          )),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (ctx, index) {
                                  return SizedBox(
                                    width: 5,
                                  );
                                },
                                itemCount: provider.categoryTypes.length),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text(  Provider.of<HomeProvider>(context,listen: false).name ??'',

                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.7) ,
                              fontWeight: FontWeight.bold ,
                              fontSize: 18
                            ),
                          ),
                          provider.productsFromCategory.isEmpty&&provider.loadingFromCategory==false
                              ? SizedBox():
                          provider.loadingFromCategory?  Center(child: CircularProgressIndicator(color: ConstantApp.greenColor,)):  SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.3,
                                  child: ListViewWidgetProductCategory(),
                                )  ,
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          const TitleWidgetForCards(txt: 'All Products'),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: ListViewScrollable(
                                  product: provider.homeProductList)),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
          );
    });
  }
}
