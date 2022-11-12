import 'dart:convert';
import 'package:e_commerce_intern/utls/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchProvider extends ChangeNotifier {

  bool loading  = false;
List datta = [] ;
  search(  {required  String word  ,required String token} ) async{
  datta =[ ];
  loading = true;
  notifyListeners();
  http.Response res = await http.post(
      Uri.parse('https://student.valuxapps.com/api/products/search'),
      headers: {
        "Authorization": token

      },
      body: {
        "text": word
      }
  );
  if(res.statusCode == 200 ) {
    loading  =false;
    datta.addAll(json.decode(res.body)['data']['data']) ;
    // print (datta) ;
    notifyListeners();
  }
  else {
    loading =false;
    ConstantApp().toast(msg: json.decode(res.body)['message'], color: Colors.red);
    notifyListeners();
}


  }


}