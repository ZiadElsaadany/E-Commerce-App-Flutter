import 'package:e_commerce_intern/utls/app_constant.dart';
import 'package:e_commerce_intern/view/auth/custom_button.dart';
import 'package:e_commerce_intern/view/auth/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/img_2.png',width: MediaQuery.of(context).size.width*0.15,),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.12,
                ),
                Text( 'Loging',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26
                ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.01,
                ),
                Text( 'Enter your emails and password',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16
                ),
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
               suffixIcon: Icon  ( Icons.visibility),
             ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                    ),
                  ],
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height*0.02,
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(word: 'Log In',)
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\' have an account?  ',style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),),
                    Text('SignUp ',style: TextStyle(
                      color: ConstantApp.greenColor
                    ),),
                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
