import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
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
      Utills.showDialogError("$e");
      return ProductModel();
    }
  }
//

  Future<ProductDetailsModel> postProductDetails(int productId) async {
    try {
      var response = await http.post(
        Uri.parse("${APIREQUEST.baseUrl}${APIREQUEST.productDetails}"),
        headers: {
          "Accept": "application/json",
        },
        body: {
          "id": productId, // Ensure the ID is passed as a string
        },
      );

      var myJsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        // Assuming your ProductDetailsModel constructor expects the 'Data' field
        return ProductDetailsModel.fromJson(myJsonData['Data']);
      } else {
        return ProductDetailsModel(); // Return an empty model or handle error as needed
      }
    } catch (e) {
<<<<<<< HEAD
      // Show the error message
      ToastComponent.showDialogError("Error: $e");
=======
      Utills.showDialogError("$e");
>>>>>>> Muhammad_Younis
      return ProductDetailsModel();
    }
  }
}
