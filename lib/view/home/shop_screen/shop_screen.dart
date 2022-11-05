import 'package:e_commerce_intern/providers/home_provider.dart';
import 'package:e_commerce_intern/view/home/shared_/search_widget.dart';
import 'package:e_commerce_intern/view/home/shop_screen/listViewScrollable_widget.dart';
import 'package:e_commerce_intern/view/home/shop_screen/list_view_widget_product_category.dart';
import 'package:e_commerce_intern/view/home/shop_screen/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatelessWidget {
   ShopScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context,provider,_) {
        return  Provider.of<HomeProvider>(context).loading?
       Center(child: CircularProgressIndicator()): Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SearchWidget(),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              Image.asset('assets/images/img_9.png') ,
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              const TitleWidgetForCards(txt:'Categories' ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),

              SizedBox(
                height: MediaQuery.of(context).size.height*0.13,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx,index){
                      return GestureDetector(
                        onTap: ( ) {
                          provider.getProductsFromCategories(id: provider.categoryTypes[index]['id']);
                        },
                        child: Container(
                          // alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width*0.7,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xffF7A593).withOpacity(0.25)
                          ),
                          child:Row(
                            children: [
                              SizedBox(width: 20,),
                              Expanded(
                                child: FadeInImage.assetNetwork(
                                    imageErrorBuilder: (m,c,v){
                                      return  Image.asset('assets/images/loadingPicture.jpg');
                                    },
                                    placeholder: 'assets/images/loadingPicture.jpg',
                                    image: provider.categoryTypes[index]['image'],width: 60),
                              ),
                              SizedBox(width: 20,),
                              Expanded(child: Text(provider.categoryTypes[index]['name'],style:
                                TextStyle(
                                  fontWeight: FontWeight.bold
                                )
                                ,)),
                            ],
                          ),
                        ),
                      ) ;
                    }, separatorBuilder: (ctx,index) {
                  return SizedBox(width: 5,);
                }, itemCount: provider.categoryTypes.length),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),

               provider.productsFromCategory.isEmpty?
                 Text('Choose The Category For Display Products'):         SizedBox(
                 height: MediaQuery.of(context).size.height*0.3,
                child:
                 ListViewWidgetProductCategory( ),
               ),








              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              const TitleWidgetForCards(txt:'All Products' ),

              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
               SizedBox(
                   height: MediaQuery.of(context).size.height*0.3,
                   child: ListViewScrollable(product: provider.homeProductList)),






            ],
          ),
        );
      }
    );
  }
}
