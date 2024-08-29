import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:service_app/Constants/api_url.dart';
import 'package:service_app/Models/product.dart';
import 'package:service_app/Utils/toast_component.dart';

class ProductController extends ChangeNotifier{

ProductModel? productModel;

Future<ProductModel> getProducts()async{
  try{
  var response  =  await http.post(Uri.parse("${APIREQUEST.baseUrl}${APIREQUEST.productUrl}"),
  body: {
    "category_id":"5",
    "sub_category_id":"4",
    "show_on_home":"1",
  }
  );
  log("MyProducts ==> ${response.body}");
  var myJsonData = jsonDecode(response.body);
  if(response.statusCode == 200){
    productModel = ProductModel.fromJson(myJsonData);
    return productModel!;
  }else{
    return ProductModel();
  }
}catch(e){
  ToastComponent.showDialog("");
  return ProductModel();
}
}


}