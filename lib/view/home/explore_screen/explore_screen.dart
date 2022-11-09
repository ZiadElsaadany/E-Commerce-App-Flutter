import 'package:e_commerce_intern/providers/home_provider.dart';
import 'package:e_commerce_intern/view/category_details/category_details.dart';
import 'package:e_commerce_intern/view/home/shared_/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
        SearchWidget(),
            Expanded(
              child: GridView.builder(
                 physics: BouncingScrollPhysics(),
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2
              ) ,
                  itemBuilder: (ctx,index)=> InkWell(
                    onTap: ( )  {
                      Navigator.pushNamed(context, CategoryDetails.id ,arguments:
                          CategoryDetailsModel(id:    context.read<HomeProvider>().categoryTypes[index]['id'], name:
                          context.read<HomeProvider>().categoryTypes[index]['name']
                          )

                      ) ;
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                         border: Border.all(color:Color(0xffF7A593)),
                        color: Color(0xffF7A593).withOpacity(0.25)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FadeInImage.assetNetwork(placeholder: 'assets/images/loadingPicture.jpg',

                      image: context.read<HomeProvider>().categoryTypes[index]['image'],width: MediaQuery.of(context).size.width*0.3,

                          imageErrorBuilder: (x,b,v )  {
                            return Image.asset('assets/images/loadingPicture.jpg');
                          },
                          ),

                          SizedBox(
                            height: 5,
                          ),
                          Text( context.read<HomeProvider>().categoryTypes[index]['name'],style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),textAlign: TextAlign.center,)
                        ],
                      ),
                    ),
                  ),
                itemCount:context.read<HomeProvider>().categoryTypes.length,


              ),
            ),
          ],
        ),
      ),
    );
  }
}
class CategoryDetailsModel {
  int id;
  String name  ;
  CategoryDetailsModel(
  {
    required this.id ,
    required this.name
}
      ) ;
}
