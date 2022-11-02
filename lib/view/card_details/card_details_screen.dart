import 'package:e_commerce_intern/animation/fade_animation.dart';
import 'package:e_commerce_intern/utls/app_constant.dart';
import 'package:e_commerce_intern/view/auth/shared/custom_button.dart';
import 'package:e_commerce_intern/view/home/home.dart';
import 'package:e_commerce_intern/view/home/shared_/minus_plus_widget.dart';
import 'package:flutter/material.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({Key? key}) : super(key: key);
static const String id = 'CardDet';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Banana'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: ( ) {} ,
            icon: Icon(Icons.upload_sharp),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeAnimation(1.2, child:  Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.3,
              decoration: BoxDecoration (
                  borderRadius: BorderRadius.only(
                      bottomRight:Radius.circular(25) ,
                      bottomLeft: Radius.circular(25)
                  ),
                  color: Colors.grey.withOpacity(0.3)
              ),
              child: Image.asset('assets/images/img_8.png'),
            ) ,),
//
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Banana mas ams',style: TextStyle (
                          fontSize: 18,
                          fontWeight: FontWeight.w900),),
                      IconButton(onPressed: (){}, icon: Icon(
                          Icons.favorite_outline_rounded
                      ))
                    ],
                  ),
                  Text( '1kg, Price',style: TextStyle(color: Colors.grey),),
                  SizedBox(height: MediaQuery.of(context).size.height*0.03,),

                  Row(
                    children: [
                      MinusPlusWidget(),
                      Spacer(),
                      Text('\$4.99',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.03,),

                  Divider(
                    height: 2,
                    thickness: 1,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.03,),


                  const Text('Product Details',style: TextStyle (
                      fontSize: 18,
                      fontWeight: FontWeight.bold),),
                  SizedBox(height: 10 ) ,
                  Text('Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.'),
                  SizedBox(height: MediaQuery.of(context).size.height*0.03,),

                  Divider(
                    height: 2,
                    thickness: 1,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.03,),


                  const Text('Nutritions',style: TextStyle (
                      fontSize: 18,
                      fontWeight: FontWeight.bold),),
                  SizedBox(height: MediaQuery.of(context).size.height*0.03,),




                  Divider(
                    height: 2,
                    thickness: 1,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01 ) ,
                 Row (
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     const Text('Review',style: TextStyle (
                         fontSize: 18,
                         fontWeight: FontWeight.bold),),
                     Icon(Icons.star,color: ConstantApp.greenColor,)
                   ]

                 ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                  SizedBox(
                      width: double.infinity,
                      child: CustomButton(word: 'Add To Basket', txt: Home.id)),
                  SizedBox(height: MediaQuery.of(context).size.height*0.03,),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
