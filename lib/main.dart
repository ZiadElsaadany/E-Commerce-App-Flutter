import 'package:e_commerce_intern/view/auth/login_screen/login_screen.dart';
import 'package:e_commerce_intern/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main (   ) {
  runApp(Ecommerce());
}
class Ecommerce extends StatelessWidget {
  const Ecommerce({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id:(ctx)=> SplashScreen(),
        LoginScreen.id :(ctx)=>LoginScreen()
      },
    );
  }
}
