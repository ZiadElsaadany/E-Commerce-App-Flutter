import 'dart:ffi';

import 'package:e_commerce_intern/models/product_model/Product_model.dart';
import 'package:e_commerce_intern/providers/home_provider.dart';
import 'package:e_commerce_intern/utls/app_constant.dart';
import 'package:e_commerce_intern/view/card_details/card_widget.dart';
import 'package:e_commerce_intern/view/home/explore_screen/explore_screen.dart';
import 'package:e_commerce_intern/view/home/home.dart';
import 'package:e_commerce_intern/view/home/shop_screen/card_widget_category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/product_details_provider.dart';
import '../card_details/card_details_screen.dart';

class CategoryDetails extends StatelessWidget {
static const String id= 'CategoriesDet';
  @override
  Widget build(BuildContext context) {
   CategoryDetailsModel args = ModalRoute.of(context)!.settings.arguments as CategoryDetailsModel;
    return FutureBuilder (
      future: context.read<HomeProvider>().getProductsFromCategories(id: args.id),
      builder: ( ctx ,snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              foregroundColor: Colors.black,
            ),
            body:  Center(
              child: CircularProgressIndicator(
                    color: ConstantApp.greenColor,
                  ),
            )
          );
        }
        if(snapshot.connectionState == ConnectionState.none) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              foregroundColor: Colors.black,
            ),
            body:  Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/no_internet.jpg'),
              ],
            )
          );
        }
        return Scaffold(
            appBar: AppBar(
              backgroundColor: ConstantApp.greenColor,
              title:Text ( args.name) ,
              centerTitle: true,
              actions: [
                IconButton(onPressed: ( )  {
                  Navigator.pushNamed(context,Home.id);
                }, icon: Icon(Icons.explore))
              ],
            ),
            body: Padding(
              padding:  EdgeInsets.all(20),
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 10
                ),


                itemBuilder: (ctx,index)=>GestureDetector(
                  onTap: ( ) {
                    Provider.of<ProductDetailsProvider>(context,listen: false).showProductDetails(id: context.read<HomeProvider>().productsFromCategory[index]['id']);
                    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                      return CardDetails() ;
                    } ));
                  },
                  child: CardWidgetCategory(
                    img: context.read<HomeProvider>().productsFromCategory[index]['image'],
                    name: context.read<HomeProvider>().productsFromCategory[index]['name'],
                    price: context.read<HomeProvider>().productsFromCategory[index]['price'],
                  ),
                )  ,
                itemCount: Provider.of<HomeProvider>(context).productsFromCategory.length,
              ),
            )
        );
      },
    );
  }
}
