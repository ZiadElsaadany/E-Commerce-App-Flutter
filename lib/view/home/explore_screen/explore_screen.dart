import 'package:e_commerce_intern/providers/home_provider.dart';
import 'package:e_commerce_intern/view/category_details/category_details.dart';
import 'package:e_commerce_intern/view/home/shared_/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExploreScreen extends StatelessWidget {
   ExploreScreen({Key? key}) : super(key: key);
final List<Color> colors  =const [ Color(0xffF7A593), Color(0xffF8A44C), Color(0xff53B175), Color(0xffD3B0E0), Color(0xffB7DFF5)];
   final   List<String> images= [ 'assets/images/technology-removebg-preview.png', 'assets/images/korona-removebg-preview.png','assets/images/sports-removebg-preview.png',
     'assets/images/enara.png', 'assets/images/clothes.png'
   ];

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
                crossAxisCount: 2,
                  childAspectRatio: 0.8
              ) ,
                  itemBuilder: (ctx,index)=> GestureDetector(
                    onTap: ( )  {
                      Navigator.pushNamed(context,CategoryDetails.id ,arguments:
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
                        color:colors[index].withOpacity(0.15)
                      ),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height*0.3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Image.asset(images[index]  ,
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
