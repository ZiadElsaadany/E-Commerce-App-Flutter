
import 'dart:convert';
import 'dart:io';

import 'package:e_commerce_intern/utls/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ProfileProvider extends ChangeNotifier {

Map data ={ } ;


getProfile( {required String token } )  async {
data= {  } ;
  try  {
    http.Response res =await http.get(Uri.parse(
      'https://student.valuxapps.com/api/profile'
    ) ,
        headers: {
          "Authorization": token
        }
    ) ;
    if(res.statusCode == 200 )  {
    data.addAll(json.decode(res.body) ['data']) ;
    notifyListeners() ; 
    }else { 
      ConstantApp().toast(msg: json.decode(res.body) ['message'], color: Colors.red);
      notifyListeners();
    }

  } on SocketException {
    ConstantApp().toast(msg: 'غير متصل بالانترنت', color: Colors.red);
    notifyListeners();
  } catch(e) {
    ConstantApp().toast(msg: 'حدث خطأ غير متوقع بالرجاء اعادة المحاولة', color: Colors.red);
    notifyListeners();
  }

}

}