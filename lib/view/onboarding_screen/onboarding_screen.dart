
import 'package:e_commerce_intern/view/auth/login_screen/login_screen.dart';
import 'package:flutter/cupertino.dart';


import 'package:flutter/material.dart';

import '../../utls/app_constant.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
static const String id = 'onBoarding' ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('assets/images/img_3.png', height: double.infinity,fit: BoxFit.cover,width: double.infinity,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column (
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                  Spacer(flex: 6,),
              Image.asset('assets/images/img_5.png'),
              SizedBox(height: MediaQuery.of(context).size.height*0.04,),
              Image.asset('assets/images/img_4.png', width: MediaQuery.of(context).size.width*0.7,),
                SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                Text('Ger your groceries in as fast as one hour' ,style:
                TextStyle(
                  color: Color(0xffFCFCFC).withOpacity(0.7)
                ),) ,
                SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                                  backgroundColor: MaterialStateProperty.all(ConstantApp.greenColor),
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)
                                  ))
                              ),
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, LoginScreen.id);
                              }, child: Text(
                            'Get Started',
                            style: TextStyle(
                                fontSize: 18
                            ),
                          )) ) ,
                Spacer()


              ],),
          )

        ],
      ),
    );
  }
}
