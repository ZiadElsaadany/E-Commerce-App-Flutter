import 'dart:convert';
import 'dart:io';

import 'package:e_commerce_intern/models/product_model/Product_model.dart';
import 'package:e_commerce_intern/models/product_model/Products.dart';
import 'package:e_commerce_intern/utls/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchProvider extends ChangeNotifier {

  bool loading  = false;
List datta = [] ;
  search(  {required  String word  } ) async{
  datta =[ ];
  loading = true;
  notifyListeners();
  http.Response res = await http.post(
      Uri.parse('https://student.valuxapps.com/api/products/search'),
      headers: {
        "Authorization": "j2IlQRjXyjcaDFLHPGSstHIOV29kF9jPscE3f0kOsIRCllu3o60aicxltFBBTWDiUtx5SY"

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