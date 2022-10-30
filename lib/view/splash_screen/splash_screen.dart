import 'dart:async';

import 'package:e_commerce_intern/view/auth/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String id=  'Splash' ;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer ;

  goNext( )=> Navigator.pushReplacementNamed(context,LoginScreen.id );

  startDelay(){
    timer=Timer(const Duration(
        milliseconds: 3000
    ), ()=> goNext()
    );
  }
  @override
  void initState() {
    super.initState();
    startDelay()  ;
  }
  @override
  void dispose() {
    timer.cancel() ;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        width: double.infinity,
        child: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
                width: MediaQuery.of(context).size.width*0.8,
                child: Image.asset('assets/images/img.png')),
          ) ,
          SizedBox(
              width: MediaQuery.of(context).size.width*0.4,
              child: Image.asset('assets/images/img_1.png')) ,
          SizedBox(
            height: MediaQuery.of(context).size.height*0.02,
          ),
        ],
      ),
    )) ;
  }
}
