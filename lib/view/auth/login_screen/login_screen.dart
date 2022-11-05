
import 'package:e_commerce_intern/animation/fade_animation.dart';
import 'package:e_commerce_intern/providers/authProvider.dart';
import 'package:e_commerce_intern/view/auth/register_screen/register_screen.dart';
import 'package:e_commerce_intern/view/auth/shared/custom_button.dart';
import 'package:e_commerce_intern/view/auth/shared/custom_textfield.dart';
import 'package:e_commerce_intern/view/auth/shared/sign_in_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utls/app_constant.dart';
import '../../home/home.dart';


class LoginScreen extends StatelessWidget {
  static const String id = 'login' ;
  final GlobalKey<FormState> formKey  = GlobalKey<FormState>();
  String pass  = '';
  String email  = '';

  LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,

              child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.02
                  ),
                  FadeAnimation(1.8, child:          Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/img_2.png',width: MediaQuery.of(context).size.width*0.15,),
                    ],
                  ),),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.12,
                  ),
                  FadeAnimation(1.2, child:            Text( 'Loging',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26
                    ),
                  ),),
                    SizedBox(
                    height: MediaQuery.of(context).size.height*0.01,
                  ),
                  FadeAnimation(1.2, child:              Text( 'Enter your emails and password',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16
                    ),
                  ),),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,
                  ),
                  FadeAnimation(1.2, child: CustomTextField(
                    onChanged: (value) {
                      email = value;
                    },
                    errorText: 'Please enter your email ',
                    hintText:'Enter your email' ,
                    labelText: 'Email',
                  ),),

                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,
                  ),
                  FadeAnimation(1.2, child:   CustomTextField(
                      onChanged: (value) {
                        pass = value;
                      },
                    errorText: 'Please enter your password ',
                      labelText: 'Password',
                      hintText:'Enter your password' ,
                      suffixIcon:true
                  ),),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.02,
                  ),
                  FadeAnimation(1.2, child:       Row(
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
                  FadeAnimation(1.2, child:   SizedBox(
                      width: double.infinity,
                      child: CustomButton(word: 'Log In',fun: ( ) async  {

                        if(formKey.currentState!.validate()) {
                       await      Provider.of<AuthProvider>(context,listen: false).login(email: email, pass: pass);
                             if(     Provider.of<AuthProvider>(context,listen: false).statusLogin) {
                               Navigator.pushReplacementNamed(context, Home.id);
                             }
                        }
                      },)
                  ),),

                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,
                  ),
                  FadeAnimation(1.2, child:      SignInSignUp(route_name: RegisterScreen.id, txt1:
                  'Don’t have an account? '
                      , txt2: 'Singup')),



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
