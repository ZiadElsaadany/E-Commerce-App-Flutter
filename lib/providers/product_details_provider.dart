import 'dart:convert';
import 'dart:io';

import 'package:e_commerce_intern/utls/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ProductDetailsProvider extends ChangeNotifier {

  Map data = {};
  bool  inFav = false  ;
  bool isCart  =false;

  changeInFav (bool isCheck ) {
    if(isCheck )  {
      inFav = false;
      notifyListeners();
    }else  {
      inFav =true;
      notifyListeners() ;
    }
    notifyListeners() ;
  }
  changeInCart (bool isCheck ) {
    if(isCheck )  {
      isCart = false;
      notifyListeners();
    }else  {
      isCart =true;
      notifyListeners() ;
    }
    notifyListeners() ;
  }
  showProductDetails( {required num? id,required String token} ) async{
    data = { } ;
try {
  http.Response res = await http.get(
      Uri.parse('https://student.valuxapps.com/api/products/$id'),
      headers: {
        "Authorization": token
      }
  );
  if(res.statusCode == 200 ) {
  data.addAll(json.decode(res.body)['data']);
inFav = json.decode(res.body)['data']['in_favorites'];
isCart = json.decode(res.body)['data']['in_cart'] ;
  notifyListeners();
  print (data) ;
  }
    else {
    ConstantApp().toast(msg: json.decode(res.body)['message'], color: Colors.red);
    notifyListeners();
    }
}on SocketException  {
  ConstantApp().toast(msg: 'لا يوجد انترنت', color: Colors.red);
  notifyListeners() ;
}

catch(E){
  ConstantApp().toast(msg: 'error', color: Colors.red);
  print (E);
  notifyListeners();
}

  }



}