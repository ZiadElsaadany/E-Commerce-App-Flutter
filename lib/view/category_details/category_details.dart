import 'package:e_commerce_intern/view/card_details/card_widget.dart';
import 'package:flutter/material.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({Key? key}) : super(key: key);
static const String id = 'CategoryDet';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:Text (  'Beverages'  ) ,
        centerTitle: true,
        actions: [
IconButton(onPressed: ( )  { }, icon: Icon(Icons.person))
        ],
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10
            ),


            itemBuilder: (ctx,index)=>CardWidget( img: 'assets/images/img_13.png',),
        itemCount: 10,
        ),
      )
    );
  }
}
