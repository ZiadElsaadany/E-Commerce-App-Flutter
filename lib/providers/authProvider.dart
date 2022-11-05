

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../utls/app_constant.dart';
class AuthProvider extends ChangeNotifier {
String token ='';
bool statusLogin = false ;
bool statusRegister = false ;

register( {required String name, required String phoneNumber ,required String email ,required String pass, String? img  }) async{
  try {
    http.Response response=await http.post(Uri.parse('https://student.valuxapps.com/api/register'),
    body:    {

        "name": name ,
        "phone": phoneNumber,
        "email": email,
        "password": pass,
       "image": ''

    }   ,
    );
    if(response.statusCode == 200  )  {
      if(json.decode(response.body)['status'] == true) {
        statusRegister = true;
        token=json.decode(response.body)['data']['token'];
        notifyListeners();
        ConstantApp().toast(msg: json.decode(response.body)['message'],color: Colors.green);
      }else {
        ConstantApp().toast(msg: json.decode(response.body)['message'],color: Colors.red,);
      }
      print (json.decode(response.body)['message']) ;
      notifyListeners();
    }else{
      ConstantApp().toast(msg: json.decode(response.body)['message'],color: Colors.red);

      print ('error') ;
      notifyListeners();
    }
  } on SocketException {
    ConstantApp().toast(msg:'غير متصل بالانترنت',color: Colors.red);

    notifyListeners();
  } catch (e)  {
    ConstantApp().toast(msg:'حدث خطأ ما برجاء اعادة المجاولة',color: Colors.red);

    print (e.toString() ) ;
    notifyListeners();
  }
}
login ( {required String email , required String pass}  ) async{

  try{
    http.Response res= await http.post(Uri.parse('https://student.valuxapps.com/api/login'),
        body:  {
      'email': email ,
      'password':pass
    } );
    if(res.statusCode == 200 ) {
      print (json.decode(res.body)['message']);
      if(json.decode(res.body)['status'] == true) {
        statusLogin =true;
        ConstantApp().toast(msg: json.decode(res.body)['message'],color: Colors.green,);
        print (json.decode(res.body) ) ;
      }else {
        ConstantApp().toast(msg: json.decode(res.body)['message'],color: Colors.red,);
      }
      notifyListeners();

    } else{
      ConstantApp().toast(msg: json.decode(res.body)['message'],color: Colors.red,);

      print ('error') ;
      notifyListeners();
    }
  }on SocketException {
    ConstantApp().toast(msg:'غير متصل بالانترنت',color: Colors.red,) ;

    notifyListeners();
  }catch (e)  {
    ConstantApp().toast(msg:'حدث خطأ ما برجاء اعادة المجاولة',color: Colors.red);

    print (e.toString() ) ;
  }


}


}