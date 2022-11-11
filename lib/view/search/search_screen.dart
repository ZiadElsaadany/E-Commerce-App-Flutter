import 'package:e_commerce_intern/providers/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/product_details_provider.dart';


import '../../utls/app_constant.dart';
import '../card_details/card_details_screen.dart';
import '../home/shop_screen/card_widget_category.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String id= 'search';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<SearchProvider>(context,listen: false).search(word: '');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0 ,
        foregroundColor: Colors.black,

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(

        children: [
          TextFormField(
            onChanged: (value )  {
              Provider.of<SearchProvider>(context,listen: false).search(word: value);
            } ,
              onFieldSubmitted: (value) {
                Provider.of<SearchProvider>(context,listen: false).search(word: value);
              } ,
            decoration: InputDecoration(
              labelText: 'Search',
              hintText: 'Search For Products',
              prefixIcon: Icon(Icons.search,size: 30),
                enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  width: 0.5
                )
              ) ,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                      width: 1,
                    color: ConstantApp.greenColor
                  )
            ),
          )  ) ,
          SizedBox(height: MediaQuery.of(context).size.height*0.03,),

          Expanded(
            child: Provider.of<SearchProvider>(context).loading ?
            Center(
              child: CircularProgressIndicator(
                color: ConstantApp.greenColor,
              ),
            )  :
            Provider.of<SearchProvider>(context).datta.isEmpty  ?

            Center(child: Image.asset('assets/images/noFavpng.png'))
                : GridView.builder(
              physics: BouncingScrollPhysics(),
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2 ,
                  mainAxisSpacing:10,
                  crossAxisSpacing: 10

                ),
                itemCount:   context.read<SearchProvider>().datta.length,
                itemBuilder: (ctx ,index )  {
              return   GestureDetector(
                onTap:  ( )  {
                  Provider.of<ProductDetailsProvider>(context,listen: false).showProductDetails(id:  Provider.of<SearchProvider>(context,listen: false).datta[index]['id']);
                  Navigator.push(context, MaterialPageRoute(builder: (ctx)
                  {
                    return CardDetails();
                  } ));
                },
                      child: CardWidgetCategory(
                                 name:Provider.of<SearchProvider>(context).datta[index]['name'],
                                 price: Provider.of<SearchProvider>(context).datta[index]['price'] ,
                                 img:   Provider.of<SearchProvider>(context).datta[index]['image'] ,
                                 id:    Provider.of<SearchProvider>(context).datta[index]['id'] ,
                ),
                    ) ;
            }),
          )
        ],

        ),
      ),
    );
  }
}
