import 'package:e_commerce_intern/animation/fade_animation.dart';
import 'package:e_commerce_intern/view/home/account/account_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/profile_provider.dart';
import '../../../utls/app_constant.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Consumer<ProfileProvider>(
        builder: (context,provider,_) {
          return Column (
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
                        child: Image.network(
                          provider.data['image']
                        )
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
                              Text(
                              provider.data['name']
                                ,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22
                                ),
                              ),
                              Icon(Icons.edit,color: ConstantApp.greenColor,)
                            ],
                          ) ,
                          Text (
          provider.data['email']
          ,style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 15
                          ),),
                        ],),
                    )

                  ],
                )),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              const Divider(height: 2,thickness: 1,),
              const AccountWidget(txt: 'Orders'),
             const AccountWidget(txt: 'My Details'),
             const AccountWidget(txt: 'Payment Methods'),
             const AccountWidget(txt: 'Promo Cord'),
             const AccountWidget(txt: 'Notifecations '),
             const AccountWidget(txt: 'Help'),
             const AccountWidget(txt: 'About '),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xffF2F3F2),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      const SizedBox(width: 15,),
                      Icon(Icons.logout_outlined,color: ConstantApp.greenColor,),
                      const Spacer(),
                      Text('Log Out',style: TextStyle(
                        color: ConstantApp.greenColor,
                        fontWeight:FontWeight.bold ,
                        fontSize: 22
                      ),),
                      const Spacer(),
                    ],
                  ),
                ),
              )

            ],
          );
        }
      ),
    );
  }
}
