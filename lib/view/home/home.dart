import 'package:e_commerce_intern/providers/bottomNavProvider.dart';
import 'package:e_commerce_intern/utls/app_constant.dart';
import 'package:e_commerce_intern/view/home/shop_screen/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'explore_screen/explore_screen.dart';

class Home extends StatelessWidget {
 static const String id = 'home';
List<Widget> screens  = [ShopScreen(), ExploreScreen()] ;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: Provider.of<BottomNavProvider>(context).currentIndex==0?
          MediaQuery.of(context).size.height*0.11 : null,
          flexibleSpace:Provider.of<BottomNavProvider>(context).currentIndex==0?
          Column  (
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              Image.asset('assets/images/img_2.png',width:30 ,),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.not_listed_location_sharp),
                  Text('Dhaka, Banassre',textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),),
                ],
              )
            ],
          ) :null,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          title:Provider.of<BottomNavProvider>(context).currentIndex==1?  Text('Find Products',
          style: TextStyle(
            fontSize: 20 ,
            fontWeight: FontWeight.bold
          ),
          ):null,
          centerTitle: true,
          elevation: 0,
        ),
        body: screens[Provider.of<BottomNavProvider>(context).currentIndex],

        bottomNavigationBar: BottomNavigationBar(
          onTap: ( index ) {
            Provider.of<BottomNavProvider>(context,listen: false).changeIndex(index);

          }  ,
          unselectedItemColor: Colors.black,
          selectedItemColor: ConstantApp.greenColor,
          showSelectedLabels: true,
          currentIndex: Provider.of<BottomNavProvider>(context).currentIndex,
       showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.store,) ,
              label: 'Shop'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore) ,
              label: 'Explore',

            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.card_travel) ,
                label: 'Cart'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline_rounded) ,
                label: 'Favourite'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline) ,
                label: 'Account'
            ),
          ],
        ),
      ),
    );
  }
}
