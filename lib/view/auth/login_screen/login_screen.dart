
import 'package:e_commerce_intern/animation/fade_animation.dart';
import 'package:e_commerce_intern/view/auth/register_screen/register_screen.dart';
import 'package:e_commerce_intern/view/auth/shared/custom_button.dart';
import 'package:e_commerce_intern/view/auth/shared/custom_textfield.dart';
import 'package:e_commerce_intern/view/auth/shared/sign_in_sign_up.dart';
import 'package:flutter/material.dart';

import '../../home/home.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id = 'login' ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                FadeAnimation(1.2, child:          Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/img_2.png',width: MediaQuery.of(context).size.width*0.15,),
                  ],
                ),),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.12,
                ),
                FadeAnimation(1.5, child:            Text( 'Loging',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26
                  ),
                ),),
                  SizedBox(
                  height: MediaQuery.of(context).size.height*0.01,
                ),
                FadeAnimation(1.8, child:              Text( 'Enter your emails and password',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16
                  ),
                ),),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.03,
                ),
                FadeAnimation(2.1, child: CustomTextField(
                  hintText:'Enter your email' ,
                  labelText: 'Email',
                ),),

                SizedBox(
                  height: MediaQuery.of(context).size.height*0.03,
                ),
                FadeAnimation(2.2, child:   CustomTextField(
                    labelText: 'Password',
                    hintText:'Enter your password' ,
                    suffixIcon:true
                ),),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.02,
                ),
                FadeAnimation(2.7, child:       Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                    ),
                  ],
                ),),


                SizedBox(
                  height: MediaQuery.of(context).size.height*0.02,
                ),
                FadeAnimation(3, child:   SizedBox(
                    width: double.infinity,
                    child: CustomButton(word: 'Log In',txt: Home.id,)
                ),),

                SizedBox(
                  height: MediaQuery.of(context).size.height*0.03,
                ),
                FadeAnimation(3.3, child:      SignInSignUp(route_name: RegisterScreen.id, txt1:
                'Don’t have an account? '
                    , txt2: 'Singup')),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
