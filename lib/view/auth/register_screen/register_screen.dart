import 'package:e_commerce_intern/animation/fade_animation.dart';
import 'package:e_commerce_intern/view/auth/login_screen/login_screen.dart';
import 'package:e_commerce_intern/view/auth/shared/sign_in_sign_up.dart';
import 'package:flutter/material.dart';

import '../../../utls/app_constant.dart';
import '../../home/home.dart';
import '../shared/custom_button.dart';
import '../shared/custom_textfield.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
static const String id ='register';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height*0.02
                ),
                FadeAnimation(1, child:   Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/img_2.png',width: MediaQuery.of(context).size.width*0.15,),
                  ],
                ),),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.12,
                ),
                FadeAnimation(1.3, child:     Text( 'Sign Up',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26
                  ),
                ),),

                SizedBox(
                  height: MediaQuery.of(context).size.height*0.01,
                ),
                FadeAnimation(1.6, child:      Text( 'Enter your credentials to continue',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16
                  ),
                ),),

                SizedBox(
                  height: MediaQuery.of(context).size.height*0.03,
                ),
                CustomTextField(
                  hintText:'Enter your username' ,
                  labelText: 'Username',
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.03,
                ),

                CustomTextField(
                  hintText:'Enter your email' ,
                  labelText: 'Email',
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.03,
                ),
                CustomTextField(
                  labelText: 'Password',
                  hintText:'Enter your password' ,
                  suffixIcon: true,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.02,
                ),
                Row(
                  children: [
                    Expanded(
                      child: RichText(
                          text: TextSpan(
                            text: 'By continuing you agree to our ' ,
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(text: 'Terms of Service and Privacy Policy.',
                              style: TextStyle(
                                color: ConstantApp.greenColor
                              )
                              ),


                            ]
                          ),
                      ),
                    ),

                  ],
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height*0.02,
                ),
                SizedBox(
                    width: double.infinity,
                    child: CustomButton(word: 'Sign Up',txt: Home.id,)
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.03,
                ),
            SignInSignUp(
              route_name: LoginScreen.id,
              txt1: 'Already have an account?  ',
              txt2: 'SignIn',
            )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
