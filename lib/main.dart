import 'package:e_commerce_intern/providers/authProvider.dart';
import 'package:e_commerce_intern/providers/bottomNavProvider.dart';
import 'package:e_commerce_intern/providers/cart_provider.dart';
import 'package:e_commerce_intern/providers/favourtie_provider.dart';
import 'package:e_commerce_intern/providers/home_provider.dart';
import 'package:e_commerce_intern/providers/product_details_provider.dart';
import 'package:e_commerce_intern/providers/profile_provider.dart';
import 'package:e_commerce_intern/providers/search_provider.dart';
import 'package:e_commerce_intern/view/auth/login_screen/login_screen.dart';
import 'package:e_commerce_intern/view/auth/register_screen/register_screen.dart';
import 'package:e_commerce_intern/view/card_details/card_details_screen.dart';
import 'package:e_commerce_intern/view/category_details/category_details.dart';
import 'package:e_commerce_intern/view/home/home.dart';
import 'package:e_commerce_intern/view/onboarding_screen/onboarding_screen.dart';
import 'package:e_commerce_intern/view/search/search_screen.dart';
import 'package:e_commerce_intern/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


void main (   ) {

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white, // navigation bar color
    statusBarColor: Colors.black,
    statusBarBrightness: Brightness.dark// status bar color
  ));
  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx){
          return BottomNavProvider() ;
        }),
        ChangeNotifierProvider(create: (ctx)=>AuthProvider()),
        ChangeNotifierProvider(create: (ctx)=>HomeProvider()),
        ChangeNotifierProvider(create: (ctx)=>ProductDetailsProvider()),
        ChangeNotifierProvider(create: (ctx)=>CartProvider()),
        ChangeNotifierProvider(create: (ctx)=>Favourite()),
        ChangeNotifierProvider(create: (ctx)=>SearchProvider()),
        ChangeNotifierProvider(create: (ctx)=>ProfileProvider()),
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
        Home.id: (ctx) =>Home(),
         CategoryDetails.id:(ctx)=>CategoryDetails( ),
         CardDetails.id:(ctx)=>CardDetails( ),
        SearchScreen.id:(ctx)=>SearchScreen()
      },
    );
  }
}
