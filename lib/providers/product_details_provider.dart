import 'dart:convert';
import 'dart:io';

import 'package:e_commerce_intern/utls/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ProductDetailsProvider extends ChangeNotifier {

  Map data = {};
  num ? id   ;

  addId( num? id ) {
    this.id = id;
    notifyListeners();
  }
  showProductDetails( {required num? id} ) async{
    data = { } ;
try {
  http.Response res = await http.get(
      Uri.parse('https://student.valuxapps.com/api/products/$id'),
      headers: {
        "Authorization": "j2IlQRjXyjcaDFLHPGSstHIOV29kF9jPscE3f0kOsIRCllu3o60aicxltFBBTWDiUtx5SY"
      }
  );
  if(res.statusCode == 200 ) {
  data.addAll(json.decode(res.body)['data']);
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