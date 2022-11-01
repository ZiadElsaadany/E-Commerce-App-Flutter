import 'package:e_commerce_intern/view/category_details/category_details.dart';
import 'package:e_commerce_intern/view/home/shared_/search_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                      Navigator.pushNamed(context, CategoryDetails.id);
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
                          Image.asset('assets/images/img_7.png',width: MediaQuery.of(context).size.width*0.3,),
                          SizedBox(
                            height: 20,
                          ),
                          Text( 'Frash Fruits & Vegetable',style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    ),
                  ),
                itemCount: 10,


              ),
            ),
          ],
        ),
      ),
    );
  }
}
