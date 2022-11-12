import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:simple_animations/simple_animations.dart';

import '../utls/app_constant.dart';
class Favourite extends ChangeNotifier {

  List fav = [] ;


  bool loadingWhenGet= false;
  getFavourite( {required String token}  ) async{
    fav= [] ;
    try {
      loadingWhenGet = true;
      notifyListeners();
      http.Response res  = await http.get(Uri.parse('https://student.valuxapps.com/api/favorites'),
          headers: {
            "Authorization":token
          }
      );
      if(res.statusCode == 200) {
        loadingWhenGet = false;
        notifyListeners();
        fav.addAll(json.decode(res.body)['data']['data'] ) ;
        notifyListeners();
      }else {
        loadingWhenGet = false;
        ConstantApp().toast(msg: json.decode(res.body)['message'], color: Colors.red);
        notifyListeners();
      }
    }on SocketException {
      loadingWhenGet = false;
      ConstantApp().toast(msg: 'NO Internet', color: Colors.red);
      notifyListeners() ;
    }

    catch (e)  {
      loadingWhenGet = false;
      ConstantApp().toast(msg: 'حدث خطا ما بالرجاء اعادة المحاولة', color: Colors.red);
      print (e.toString());
      notifyListeners();
    }
  }


  bool loadingWhenPost = false;
  Future addToFav({  required num? productId ,required String token} ) async {

    try {
      loadingWhenPost = true;
      notifyListeners();
      http.Response res  = await http.post(Uri.parse('https://student.valuxapps.com/api/favorites'),
          body: {
            "product_id": '$productId'
          },
          headers: {
            "Authorization":token
          }
      );
      if(res.statusCode == 200 )  {
        loadingWhenPost = false;
        notifyListeners();
        print('post product done') ;
        print (json.decode(res.body)['data']);

        ConstantApp().toast(msg: json.decode(res.body)['message'], color: Colors.green) ;
        notifyListeners() ;
      } else {
        loadingWhenPost = false;
        ConstantApp().toast(msg: json.decode(res.body)['message'], color: Colors.red) ;
        notifyListeners();
      }

    }catch(e) {
      loadingWhenPost = false;
      print (e.toString()) ;
      ConstantApp().toast(msg: 'حدث خطا ما', color: Colors.red) ;
      notifyListeners() ;
    }

  }
}