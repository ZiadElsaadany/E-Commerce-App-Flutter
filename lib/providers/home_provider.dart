import 'dart:convert';
import 'dart:io';
import 'package:e_commerce_intern/models/product_model/Product_model.dart';
import 'package:e_commerce_intern/models/product_model/Products.dart';
import 'package:e_commerce_intern/utls/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/product_model/Banners.dart';

class HomeProvider extends ChangeNotifier{
  ProductModel ?  productModelAll ;

 List<Products>  homeProductList=[];
 List categoryTypes= [] ;
 List productsFromCategory= [] ;
  List<dynamic> banners =[] ;
 bool loading = false;
 bool loadingCategoryType = false;



 String ?  name  ;
 getNameCategory({required String name }){
   this.name =name;
   notifyListeners();
 }


  getHomeProduct (  ) async{
    loading =true;
    notifyListeners();
    try {
      print ('tmmmmmmmmmmmmmmmmmmmmmmmmmmmm');
      http.Response res = await http.get(
          Uri.parse('https://student.valuxapps.com/api/home'),
          headers: {
            "Authorization":"j2IlQRjXyjcaDFLHPGSstHIOV29kF9jPscE3f0kOsIRCllu3o60aicxltFBBTWDiUtx5SY"
          }
      );
      print ('finish try');
      if(res.statusCode ==200 ){
        print ('reessssssssssssssss true     fkkdfkd');
      productModelAll= ProductModel.fromJson(json.decode(res.body)) ;
      homeProductList.addAll(productModelAll!.data!.products??[]);
      banners.addAll(productModelAll!.data!.banners??[]);
     print ( """""""""""""""""""fgjpgignp""""""""""""""""""" ) ;

   notifyListeners();
   print( '$homeProductList hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');

    loading = false;
   notifyListeners();
      }else {
        loading =false;
        ConstantApp().toast(msg: json.decode(res.body)['message'], color: Colors.red);
        notifyListeners();
      }
    } on SocketException  {
      loading =false;
      ConstantApp().toast(msg: 'لا يوجد انترنت', color: Colors.red);
notifyListeners() ;
    }

    catch(E){
      loading =false;
      ConstantApp().toast(msg: 'error', color: Colors.red);
      print (E);
      notifyListeners();
    }
  }
  getCategories (  )async {
    notifyListeners();
    try {
      print ('tmmmmmmmmmmmmmmmmmmmmmmmmmmmm');
      http.Response res = await http.get(
          Uri.parse('https://student.valuxapps.com/api/categories')
      );
      categoryTypes = json.decode(res.body)['data']['data'];
      notifyListeners();
      print ('finish try');
      if(res.statusCode ==200 ){
        print ('reessssssssssssssss true     fkkdfkd');

        notifyListeners();
        print( '$homeProductList hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
        notifyListeners();
      }else {
        ConstantApp().toast(msg: json.decode(res.body)['message'], color: Colors.red);
        notifyListeners();
      }
    } on SocketException  {
      ConstantApp().toast(msg: 'لا يوجد انترنت', color: Colors.red);
      notifyListeners() ;
    }

    catch(E){
      ConstantApp().toast(msg: 'error', color: Colors.red);
      print (E);
      notifyListeners();
    }
  }


  bool loadingFromCategory = false;
  getProductsFromCategories({required int id }) async {
    productsFromCategory = [] ;
    loadingFromCategory = true ;
    try {
      loadingFromCategory = true ;
      notifyListeners();
      print ('tmmmmmmmmmmmmmmmmmmmmmmmmmmmm');
      http.Response res = await http.get(
          Uri.parse('https://student.valuxapps.com/api/products?category_id=$id') ,
          headers: {
            "Authorization":"j2IlQRjXyjcaDFLHPGSstHIOV29kF9jPscE3f0kOsIRCllu3o60aicxltFBBTWDiUtx5SY"
          }
      );
      productsFromCategory = json.decode(res.body)['data']['data']  ;
      notifyListeners();
      print ('finish try');
      if(res.statusCode ==200 ){
        print ('reessssssssssssssss true     fkkdfkd');
      loadingFromCategory =false;
        notifyListeners();
        print( '$productsFromCategory hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
        notifyListeners();
      }else {
        loadingFromCategory =false;
        ConstantApp().toast(msg: json.decode(res.body)['message'], color: Colors.red);
        notifyListeners();
      }
    } on SocketException  {
      loadingFromCategory =false;
      ConstantApp().toast(msg: 'لا يوجد انترنت', color: Colors.red);
      notifyListeners() ;
    }

    catch(E){
      loadingFromCategory =false;
      ConstantApp().toast(msg: 'error', color: Colors.red);
      print (E);
      notifyListeners();
    }
  }



}