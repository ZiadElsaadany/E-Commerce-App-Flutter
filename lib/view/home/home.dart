import 'package:e_commerce_intern/providers/bottomNavProvider.dart';
import 'package:e_commerce_intern/providers/profile_provider.dart';

import 'package:e_commerce_intern/utls/app_constant.dart';
import 'package:e_commerce_intern/view/home/favourite/favourtie_screen.dart';
import 'package:e_commerce_intern/view/home/my_cart_screen/my_cart_screen.dart';
import 'package:e_commerce_intern/view/home/shop_screen/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../providers/authProvider.dart';
import '../../providers/home_provider.dart';
import 'account/account_screen.dart';
import 'explore_screen/explore_screen.dart';

class Home extends StatefulWidget {
  static const String id = 'home';

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> screens = [
    ShopScreen(),
    ExploreScreen(),
    const MyCartScreen(),
    const FavouriteScreen(),
    const AccountScreen()
  ];
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      Provider.of<HomeProvider>(context, listen: false).getHomeProduct(

        token:    Provider.of<AuthProvider>(context,listen: false).token,
      );
      Provider.of<HomeProvider>(context, listen: false).getCategories();
      Provider.of<ProfileProvider>(context, listen: false).getProfile(
        token:    Provider.of<AuthProvider>(context,listen: false).token
      );
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Provider.of<BottomNavProvider>(context).currentIndex == 4
            ? null
            : AppBar(
                toolbarHeight:
                    Provider.of<BottomNavProvider>(context).currentIndex == 0
                        ? MediaQuery.of(context).size.height * 0.11
                        : null,
                flexibleSpace:
                    Provider.of<BottomNavProvider>(context).currentIndex == 0
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Image.asset(
                                'assets/images/img_2.png',
                                width: 30,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.not_listed_location_sharp),
                                  Text(
                                    'Tanta, Sebrbay',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          )
                        : null,
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
          systemOverlayStyle: const SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.light, // For Android (dark icons)
            statusBarBrightness: Brightness.light,
          ),
                title: Provider.of<BottomNavProvider>(context).currentIndex == 1
                    ? const Text(
                        'Find Products',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    : Provider.of<BottomNavProvider>(context).currentIndex == 2
                        ? const Text(
                            'My Cart',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        : Provider.of<BottomNavProvider>(context)
                                    .currentIndex ==
                                3
                            ? const Text(
                                'My Favourite',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            : null,
                centerTitle: true,
                elevation: 0,
              ),
        body: screens[Provider.of<BottomNavProvider>(context).currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            Provider.of<BottomNavProvider>(context, listen: false)
                .changeIndex(index);
          },
          unselectedItemColor: Colors.black.withOpacity(0.6),
          selectedItemColor: ConstantApp.greenColor,
          showSelectedLabels: true,
          currentIndex: Provider.of<BottomNavProvider>(context).currentIndex,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.store,
                  size: 30,
                ),
                label: 'Shop'),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore,
                size: 30,

              ),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.card_travel,  size: 30,

                ), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline_rounded,                   size: 30,

                ), label: 'Favourite'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline,                  size: 30,

                ), label: 'Account'),
          ],
        ),
      ),
    );
  }
}
