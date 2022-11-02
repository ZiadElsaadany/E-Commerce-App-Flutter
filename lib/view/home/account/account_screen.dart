import 'package:e_commerce_intern/animation/fade_animation.dart';
import 'package:e_commerce_intern/view/home/account/account_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utls/app_constant.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column (
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.05,) ,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: FadeAnimation(1.2, child: Row(
              children: [
                Expanded(
                  flex : 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset('assets/images/linkedinPicture2.jpg',
                    ),
                  ),
                ),

                SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                Expanded(
                  flex: 4,
                  child: Column (

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Ziad Alsaadany '
                            ,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22
                            ),
                          ),
                          Icon(Icons.edit,color: ConstantApp.greenColor,)
                        ],
                      ) ,
                      Text ( 'ziadelsaadany73@gmail.com',style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15
                      ),),
                    ],),
                )

              ],
            )),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.03,),
          Divider(height: 2,thickness: 1,),
          AccountWidget(txt: 'Orders'),
         AccountWidget(txt: 'My Details'),
         AccountWidget(txt: 'Payment Methods'),
         AccountWidget(txt: 'Promo Cord'),
         AccountWidget(txt: 'Notifecations '),
         AccountWidget(txt: 'Help'),
         AccountWidget(txt: 'About '),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xffF2F3F2),
                borderRadius: BorderRadius.circular(20)
              ),
              alignment: Alignment.center,
              child: Row(
                children: [
                  SizedBox(width: 15,),
                  Icon(Icons.logout_outlined,color: ConstantApp.greenColor,),
                  Spacer(),
                  Text('Log Out',style: TextStyle(
                    color: ConstantApp.greenColor,
                    fontWeight:FontWeight.bold ,
                    fontSize: 22
                  ),),
                  Spacer(),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
