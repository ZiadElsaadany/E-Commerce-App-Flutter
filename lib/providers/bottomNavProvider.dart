import 'package:flutter/cupertino.dart';

class BottomNavProvider extends ChangeNotifier {


  int currentIndex = 0 ;
  changeIndex  ( int i )  {
    currentIndex = i ;
    notifyListeners();
  }
}
