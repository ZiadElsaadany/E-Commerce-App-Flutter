import 'dart:convert';
import 'dart:io';

import 'package:e_commerce_intern/utls/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'  as http ;
class CartProvider extends ChangeNotifier{

  List getCartList = [] ;



bool loading= false;


Map datta ={ };
late bool inCart;


  getCarts( ) async {
    getCartList = [];

    loading = true;
    notifyListeners();
    http.Response res = await http.get(
        Uri.parse('https://student.valuxapps.com/api/carts'),
        headers: {
          "Authorization": "j2IlQRjXyjcaDFLHPGSstHIOV29kF9jPscE3f0kOsIRCllu3o60aicxltFBBTWDiUtx5SY"
        }
    );
    if (res.statusCode == 200) {
      loading = false;
      datta = json.decode(res.body)['data'];
      getCartList = json.decode(res.body)['data']['cart_items'];
      notifyListeners();
    } else {
      loading = false;
      ConstantApp().toast(
          msg: json.decode(res.body)['message'], color: Colors.red);
      notifyListeners();
    }
  }


  bool loadingAddedOrDeleted = false;

  addToCarts({  required num? productId } ) async {


    try {
      loadingAddedOrDeleted = true;
      notifyListeners();
      http.Response res  = await http.post(Uri.parse('https://student.valuxapps.com/api/carts'),
          body: {
              "product_id": '$productId'
          },
          headers: {
            "Authorization":"j2IlQRjXyjcaDFLHPGSstHIOV29kF9jPscE3f0kOsIRCllu3o60aicxltFBBTWDiUtx5SY"
          }
      );
      if(res.statusCode == 200 )  {
        loadingAddedOrDeleted = false;

        print('post product done') ;
        print (json.decode(res.body)['data']);

        ConstantApp().toast(msg: json.decode(res.body)['message'], color: Colors.green) ;
        notifyListeners() ;
      } else {
        loadingAddedOrDeleted = false;
        ConstantApp().toast(msg: json.decode(res.body)['message'], color: Colors.red) ;
        notifyListeners();
      }

    }catch(e) {
      loadingAddedOrDeleted = false;
      print (e.toString()) ;
      ConstantApp().toast(msg: 'حدث خطا ما', color: Colors.red) ;
      notifyListeners() ;
    }

  }

}