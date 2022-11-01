import 'package:e_commerce_intern/providers/bottomNavProvider.dart';
import 'package:e_commerce_intern/view/auth/login_screen/login_screen.dart';
import 'package:e_commerce_intern/view/auth/register_screen/register_screen.dart';
import 'package:e_commerce_intern/view/home/home.dart';
import 'package:e_commerce_intern/view/onboarding_screen/onboarding_screen.dart';
import 'package:e_commerce_intern/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main (   ) {
  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx){
          return BottomNavProvider() ;
        })
      ],
      child: Ecommerce()));
}
class Ecommerce extends StatelessWidget {
  const Ecommerce({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id:(ctx)=> SplashScreen(),
        LoginScreen.id :(ctx)=>LoginScreen(),
        RegisterScreen.id:(ctx)=>RegisterScreen(),
        OnBoardingScreen.id:(ctx)=>OnBoardingScreen(),
        Home.id: (ctx) =>Home()
      },
    );
  }
}
