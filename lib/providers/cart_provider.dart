import 'dart:convert';
import 'dart:io';

import 'package:e_commerce_intern/utls/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'  as http ;
class CartProvider extends ChangeNotifier{

  List getCartList = [] ;

  double totalPrice = 0 ;

   totalPriceMethod(  price) {
     totalPrice += price ;
     notifyListeners();
  }
  getCarts( ) async{
  try {
      http.Response res  = await http.get(Uri.parse('https://student.valuxapps.com/api/carts'),
          headers: {
            "Authorization":"j2IlQRjXyjcaDFLHPGSstHIOV29kF9jPscE3f0kOsIRCllu3o60aicxltFBBTWDiUtx5SY"
          }
      );
      if(res.statusCode == 200) {
        getCartList = json.decode(res.body)['data']['cart_items'];
        print (getCartList) ;
        notifyListeners();
      }else {
        ConstantApp().toast(msg: json.decode(res.body)['message'], color: Colors.red);
        notifyListeners();
      }
    }on SocketException {
      ConstantApp().toast(msg: 'NO Internet', color: Colors.red);
      notifyListeners() ;
    }

    catch (e)  {
      ConstantApp().toast(msg: 'حدث خطا ما بالرجاء اعادة المحاولة', color: Colors.red);
      print (e.toString());
      notifyListeners();
    }
  }

  addToCarts({  required num? productId } ) async {

    try {
      http.Response res  = await http.post(Uri.parse('https://student.valuxapps.com/api/carts'),
          body: {
              "product_id": '$productId'
          },
          headers: {
            "Authorization":"j2IlQRjXyjcaDFLHPGSstHIOV29kF9jPscE3f0kOsIRCllu3o60aicxltFBBTWDiUtx5SY"
          }
      );
      if(res.statusCode == 200 )  {

        print('post product done') ;
        print (json.decode(res.body)['data']);

        ConstantApp().toast(msg: json.decode(res.body)['message'], color: Colors.green) ;
        notifyListeners() ;
      } else {
        ConstantApp().toast(msg: json.decode(res.body)['message'], color: Colors.red) ;
        notifyListeners();
      }

    }catch(e) { 
      print (e.toString()) ; 
      ConstantApp().toast(msg: 'حدث خطا ما', color: Colors.red) ;
      notifyListeners() ;
    }

  }

}