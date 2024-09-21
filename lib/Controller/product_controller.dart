import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:service_app/Constants/api_url.dart';
import 'package:service_app/Models/product.dart';
import 'package:service_app/Models/product_details.dart';
import 'package:service_app/Utils/toast_component.dart';

class ProductController extends ChangeNotifier {
//
  ProductModel? productModel;
  ProductDetailsModel? productDetail;

//
  Future<ProductModel> getProducts({int? catId, int? subCatId}) async {
    try {
      var response = await http.post(
          Uri.parse("${APIREQUEST.baseUrl}${APIREQUEST.productUrl}"),
          headers: {
            "accept": "application/json",
          },
          body: {
            "category_id": "$catId",
            "sub_category_id": "$subCatId",
          });
      log("MyProducts ==> ${response.body}");
      var myJsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        productModel = ProductModel.fromJson(myJsonData);
        return productModel!;
      } else {
        return ProductModel();
      }
    } catch (e) {
      ToastComponent.showDialogError("$e");
      return ProductModel();
    }
  }
//

  Future<ProductDetailsModel> postProductDetails(int productId) async {
    try {
      log("ogvugyybhgy");
      var response = await http.post(
        Uri.parse("${APIREQUEST.baseUrl}${APIREQUEST.productDetails}"),
        headers: {
          "Accept": "application/json",
        },
        body: {
          "id": "$productId", // Ensure the ID is passed as a string
        },
      );
      log("${response.statusCode}");

      var myJsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        log("tgfggdrtgfth${response.body}");
        return ProductDetailsModel.fromJson(myJsonData);
      } else {
        return ProductDetailsModel();
      }
    } catch (e) {
      // Show the error message
      ToastComponent.showDialogError("Error: $e");
      return ProductDetailsModel();
    }
  }
}
